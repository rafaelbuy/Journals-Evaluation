from django import forms
from django.conf import settings
from django.contrib.auth import authenticate
from django.contrib.auth import login
from django.contrib.auth import logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.decorators import user_passes_test
from django.contrib.sites.models import Site
from django.core.mail import EmailMessage
from django.core.paginator import EmptyPage
from django.core.paginator import InvalidPage
from django.core.paginator import Paginator
from django.db.models import Q
from django.forms.models import inlineformset_factory
from django.http import HttpResponse
from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404
from django.shortcuts import render_to_response
from django.template import loader
from django.template.context import RequestContext
from django.utils.translation import ugettext as _
from evaluation.evaluations.models import Context
from evaluation.evaluations.models import Evaluation
from evaluation.evaluations.models import Followup
from evaluation.evaluations.models import Media
from evaluation.evaluations.models import Status
from evaluation.evaluations.models import Type
from evaluation.evaluations.models import Meeting
from django.contrib.auth.models import User


def index(request):
    t = loader.get_template('evaluations/home_evaluations.html')
    c = RequestContext(request)
    return HttpResponse(t.render(c))

def user_login(request):

    next = request.GET.get('next', None)

    if request.method == 'POST':
        next = request.POST['next']
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                login(request, user)
                return HttpResponseRedirect(next)
            else:
                t = loader.get_template('evaluations/home_evaluations.html')
                c = RequestContext(request, {
                                   'active': True,})
                return HttpResponse(t.render(c))
        else:
            t = loader.get_template('evaluations/home_evaluations.html')
            c = RequestContext(request, {
                               'invalid': True, 'next': next})
            return HttpResponse(t.render(c))
    else:
        t = loader.get_template('evaluations/home_evaluations.html')
        if next:
            c = RequestContext(request, {'required': True, 'next': next})
        else:
            c = RequestContext(request, {'next': next})
        return HttpResponse(t.render(c))


def user_logout(request):
    logout(request)
    t = loader.get_template('evaluations/home_evaluations.html')
    c = RequestContext(request)
    return HttpResponse(t.render(c))

@login_required
def user_index(request):

    # User without permission to list all evaluations
    if not request.user.has_perm('evaluations.list_all_evaluation'):
        request.session['count_evaluations_user'] = Evaluation.objects.filter(creator=request.user).count()
        user_evaluations = Evaluation.objects.filter(creator=request.user)
        paginator = Paginator(user_evaluations, 10) # Show 25 contacts per page

        # Make sure page request is an int. If not, deliver first page.
        try:
            page = int(request.GET.get('page', '1'))
        except ValueError:
            page = 1

        # If page request (9999) is out of range, deliver last page of results.
        try:
            evaluations = paginator.page(page)
        except (EmptyPage, InvalidPage):
            evaluations = paginator.page(paginator.num_pages)
        
    else:
        user_evaluations = Evaluation.objects.all()
        paginator = Paginator(user_evaluations, 10) # Show 25 contacts per page

        try:
            page = int(request.GET.get('page', '1'))
        except ValueError:
            page = 1

        # If page request (9999) is out of range, deliver last page of results.
        try:
            evaluations = paginator.page(page)
        except (EmptyPage, InvalidPage):
            evaluations = paginator.page(paginator.num_pages)

        request.session['count_evaluations_user'] = Evaluation.objects.all().count()
        

    meetings = Meeting.objects.all()
    t = loader.get_template('evaluations/user_evaluations.html')
    c = RequestContext(request, {
                       'user_evaluations': evaluations,
                       'meetings': meetings,
                       })
    return HttpResponse(t.render(c))

@login_required
def search(request):
    
    q = request.GET.get('q')
    
    if not request.user.has_perm('evaluations.list_all_evaluation'):
        user_evaluations = Evaluation.objects.filter(creator=request.user).filter(Q(issn__contains=q) | Q(journal_title__contains=q)
                                                                                  | Q(institution__contains=q))
    else:
        user_evaluations = Evaluation.objects.filter(Q(issn__contains=q) | Q(journal_title__contains=q)
                                                     | Q(institution__contains=q))

    paginator = Paginator(user_evaluations, 10) # Show 10 evaluations per page

    try:
        page = int(request.GET.get('page', '1'))
    except ValueError:
        page = 1

    # If page request (9999) is out of range, deliver last page of results.
    try:
        evaluations = paginator.page(page)
    except (EmptyPage, InvalidPage):
        evaluations = paginator.page(paginator.num_pages)

    t = loader.get_template('evaluations/user_evaluations.html')
    c = RequestContext(request, {
                       'user_evaluations': evaluations,
                       'search': True,
                       'q':q
                       })
    return HttpResponse(t.render(c))

class FollowupParcForm(forms.Form):

    subject = forms.CharField(label=_('Subject'), required=True, max_length=256,
                              widget=forms.TextInput(attrs={'size':'30',}))

    Context = forms.ModelChoiceField(label=_('Context'), required=True,
                                     queryset=Context.objects.none())

    Status = forms.ModelChoiceField(label=_('Status'), required=False,
                                    queryset=Status.objects.none())
                                        
    description = forms.CharField(label=_('Description'), widget=forms.Textarea(
                                  attrs={'rows':'15', 'cols':'70',}))

    def __init__(self, * args, ** kwargs):
        evaluation_dict = kwargs.pop('evaluation_dict', None)
        
        super(FollowupParcForm, self).__init__(*args, ** kwargs)

        if evaluation_dict['id']:
            self.fields['Context'].queryset = Context.objects.filter(
                                                                     type=evaluation_dict['id'])

        if evaluation_dict['can_set_status']:
            self.fields['Status'].queryset = Status.objects.filter(
                                                                   type=evaluation_dict['id'])
        if not evaluation_dict['can_set_status']:
            self.fields['Status'].widget = forms.HiddenInput()
                                           

    
@login_required
def new_iteration(request, object_id):

    #get the evaluation by id or 404 error
    evaluation = get_object_or_404(Evaluation, id=int(object_id))

    #check method POST
    if request.method == 'POST':

        #create the set of media
        MediaInlineSet = inlineformset_factory(Followup, Media, extra=3)
   
        evaluation_dict = {'id': evaluation.type,
        'can_set_status': request.user.has_perm('evaluations.can_set_status')}

        form_followup = FollowupParcForm(request.POST, request.FILES,
                                         evaluation_dict=evaluation_dict)
        
        if form_followup.is_valid():

            user = request.user
            desc = form_followup.cleaned_data['description']
            subject = form_followup.cleaned_data['subject']
            context = form_followup.cleaned_data['Context']

            if not request.user.has_perm('evaluations.can_set_status'):
                
                try:
                    fw_lt = evaluation.followup_set.latest()
                    status = fw_lt.status
                except Exception:
                    #fixme: get the first status without id number
                    status = Status.objects.get(pk=1)
                    
            else:
                status = form_followup.cleaned_data['Status']


            fw_nw = Followup(evaluation=evaluation, status=status, context=context,
                             description=desc, subject=subject,
                             reported_by=user,)

            forms_media = MediaInlineSet(request.POST, request.FILES,
                                         instance=fw_nw)

            fw_nw.save()

            if request.user.has_perm('evaluations.can_set_status'):

                evaluation_user = User.objects.get(pk=evaluation.creator_id)
                subject = _('Notification of change in SciELO Evaluation (Dont replay this message)')
                from_email = 'suporte.aplicacao@scielo.org'
                to = evaluation_user.email

                current_site = Site.objects.get(id=settings.SITE_ID)

                html_content = '<p><b>' +_('Hi, ') + str(evaluation.creator) + '</b></p>'
                html_content = html_content + '<p>' + _('Your evaluation changed the status, ')
                html_content = html_content +  _('please access your evaluation to see: ')
                html_content = html_content + '<a href=http://' + current_site.domain + \
                                            '/evaluation/history/' + str(evaluation.id) + '>' \
                                            + evaluation.journal_title + '</a></p>'
                html_content = html_content + '<p><b>' + _('SciELO Evaluation Team') + '</b></p>'
                html_content = html_content + '<p>'+ 'scielo.avaliacao@scielo.org' + '</p>'
                msg = EmailMessage(subject, html_content, from_email, [to])
                msg.content_subtype = "html"
                msg.send()

            if forms_media.is_valid():
                forms_media.save()

        return HttpResponseRedirect(evaluation.get_absolute_url())
    else:
        
        evaluation_dict = {'id': evaluation.type,
        'can_set_status': request.user.has_perm('evaluations.can_set_status')}
        
        #create the form for Followup
        form_followup = FollowupParcForm(evaluation_dict=evaluation_dict)

        #object NAMEInLineSet
        #about http://docs.djangoproject.com/en/dev/topics/forms/modelforms/
        MediaInlineSet = inlineformset_factory(Followup, Media, extra=3,
                                               can_delete=False)

        #create the form for Media
        forms_media = MediaInlineSet()
        
        forms = dict(form_followup=form_followup, forms_media=forms_media,
                     mode='newiteration', evaluation=evaluation)
                                
        return render_to_response('evaluations/new_iteration.html', forms, 
                                  context_instance=RequestContext(request))


#class to represent the form
class FollowupParcBForm(forms.Form):

    journal_title = forms.CharField(label=_('Journal Title'), required=True,
                                    max_length=256, widget=forms.TextInput(attrs={'size':'50',}))

    institution = forms.CharField(label=_('Institution'), required=True,
                                  max_length=512, widget=forms.TextInput(attrs={'size':'40',}))

    issn = forms.CharField(label=_('ISSN'), required=True, max_length=9,
                           widget=forms.TextInput(attrs={'size':'10',}))

    process = forms.ModelChoiceField(label=_('Process'), required=True,
                                     queryset=Type.objects.all())

    description = forms.CharField(label=_('Description'), required=True,
                                  widget=forms.Textarea(attrs={'rows':'15', 'cols':'70',}))

@login_required
def open_evaluation(request):

    if request.method == 'POST':

        #instance of form
        form = FollowupParcBForm(request.POST, request.FILES)
        
        if form.is_valid():
            
            #Get the user and create a new evaluation
            user = request.user
            institution = form.cleaned_data['institution']
            issn = form.cleaned_data['issn']
            journal_title = form.cleaned_data['journal_title']
            process = form.cleaned_data['process']
            description = form.cleaned_data['description']
            
            evaluation = Evaluation(type=process, creator=user, institution=institution,
                                    issn=issn, journal_title=journal_title,
                                    description=description)
            evaluation.save()

            return HttpResponseRedirect(evaluation.get_absolute_url())
        else:
             
            open_evaluation_form = FollowupParcBForm() # An unbound form
            
            return render_to_response('evaluations/open_evaluation.html', {
                                      'open_evaluation_form': open_evaluation_form,
                                      'type': type,
                                      'mode': 'open_evaluation',
                                      'form': form,
                                      'user_name': request.user.pk},
                                      context_instance=RequestContext(request))
    else:

        #recovering Evaluation Data to input form fields
        open_evaluation_form = FollowupParcBForm() # An unbound form

    return render_to_response('evaluations/open_evaluation.html', {
                              'open_evaluation_form': open_evaluation_form,
                              'type': type,
                              'mode': 'open_evaluation',
                              'user_name': request.user.pk},
                              context_instance=RequestContext(request))

@user_passes_test(lambda u: u.has_perm('evaluations.can_set_meeting'))
def set_meeting(request, evaluation_id, meeting_id):

    if request.is_ajax():
        evaluation = Evaluation.objects.get(pk=evaluation_id)

        if meeting_id == '0':
            evaluation.meeting_id = None
        else:
            evaluation.meeting_id = meeting_id
      
        evaluation.save()

    return HttpResponse("updated")
