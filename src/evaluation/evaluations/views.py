# Create your views here.
from django.template import loader
from django.template.context import RequestContext
from django.shortcuts import render_to_response, get_object_or_404
from django.forms.models import inlineformset_factory
from django.http import HttpResponseRedirect, HttpResponse
from django import forms
from django.utils.translation import ugettext as _
from django.contrib.auth.decorators import login_required
from django.core import serializers
from django.contrib.auth import logout, authenticate, login
from django.core.paginator import Paginator, InvalidPage, EmptyPage

from evaluation.evaluations.models import Evaluation, Followup, Media, Type, Context, Status

import choices


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
                c = RequestContext(request,{
                'active': True,})
                return HttpResponse(t.render(c))
        else:
            t = loader.get_template('evaluations/home_evaluations.html')
            c = RequestContext(request,{
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
        
    t = loader.get_template('evaluations/user_evaluations.html')
    c = RequestContext(request, {
        'user_evaluations': evaluations,
    })
    return HttpResponse(t.render(c))


def search(request):
    
    q=request.GET.get('q')

    user_evaluations = Evaluation.objects.filter(issn=q)
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

    t = loader.get_template('evaluations/user_evaluations.html')
    c = RequestContext(request, {
        'user_evaluations': evaluations,
    })
    return HttpResponse(t.render(c))

def get_context(request, type_id):
    contexts = Context.objects.filter(type=type_id)
    retorno = serializers.serialize("json", contexts)
    return HttpResponse(retorno, mimetype="text/javascript")


@login_required
def reopen_evaluation(request, object_id):
    evaluation = get_object_or_404(Evaluation, id=int(object_id))
    followup_latest = evaluation.followup_set.latest()
    followup_new = Followup(evaluation=evaluation, status='reopened',
                  description=followup_latest.description,
                  subject=followup_latest.subject,
                  reported_by=followup_latest.reported_by )
    followup_new.save();

    return HttpResponseRedirect(evaluation.get_absolute_url())

@login_required
def close_evaluation(request, object_id):
    evaluation = get_object_or_404(Evaluation, id=int(object_id))
    followup_latest = evaluation.followup_set.latest()
    followup_new = Followup(evaluation=evaluation, status='closed',
                 description=followup_latest.description,
                 subject=followup_latest.subject,
                 reported_by=followup_latest.reported_by )
    followup_new.save();

    return HttpResponseRedirect(evaluation.get_absolute_url())


@login_required
def resolve_evaluation(request, object_id):
    evaluation = get_object_or_404(Evaluation, id=int(object_id))
    if request.method == 'POST': # If the forms were submitted...
        form = FollowupParcForm(request.POST)
        if form.is_valid():
            desc = form.cleaned_data['description']
            fw_lt = evaluation.followup_set.latest()
            fw_nw = Followup(evaluation=evaluation, status='resolved',
                description=desc, subject=fw_lt.subject ,
                reported_by=fw_lt.reported_by, to_user=fw_lt.to_user, )
            fw_nw.save()
            
        return HttpResponseRedirect(evaluation.get_absolute_url())
    else:
        form = FollowupParcForm()
        forms = dict(form_followup=form, mode = 'resolve', evaluation=evaluation,
        username=request.user.username)
        return render_to_response('evaluations/new_iteration.html', forms,
                                context_instance=RequestContext(request))

@login_required
def accept_evaluation(request, object_id):
    if request.method == 'POST': # If the forms were submitted...
        form = FollowupParcForm(request.POST)
        if form.is_valid():
            user =  request.user
            desc = form.cleaned_data['description']
            evaluation = get_object_or_404(Evaluation, id=int(object_id))
            fw_lt = evaluation.followup_set.latest()
            fw_nw = Followup(evaluation=evaluation, status='accepted',
                description=desc, subject=fw_lt.subject ,
                reported_by=fw_lt.reported_by, to_user=user, )
            fw_nw.save()

        return HttpResponseRedirect(evaluation.get_absolute_url())
    else:
        # recovering Evaluation Data to input form fields
        followup_form = FollowupParcForm() # An unbound form
        return render_to_response('evaluations/new_iteration.html', {
            'iteration_form': followup_form,
            'evaluation_id': object_id,
            'mode': 'accept'},
            context_instance=RequestContext(request))


class FollowupParcForm(forms.Form):

    subject = forms.CharField(label=_('Subject'), required=True, max_length=256,
                                widget=forms.TextInput(attrs={'size':'30',}))

    Context = forms.ModelChoiceField(label=_('Context'), required=True,
                                        queryset=Context.objects.none())

    description = forms.CharField(label=_('Description'),widget=forms.Textarea(
                                    attrs={'rows':'15','cols':'70',}))

    def __init__(self, *args, **kwargs):
        type = kwargs.pop('evaluation_type_id', None)
        super(FollowupParcForm, self).__init__(*args, **kwargs)
        if type:
            self.fields['Context'].queryset = Context.objects.filter(
                                           type=type['id'])
@login_required
def new_iteration(request, object_id):
    
    #get the evaluation by id or 404 error
    evaluation = get_object_or_404(Evaluation, id=int(object_id))

    #check method POST
    if request.method == 'POST':

        #create the set of media
        MediaInlineSet = inlineformset_factory(Followup, Media, extra=3)

        evaluation_type_id = {'id': evaluation.type}

        form_followup = FollowupParcForm(request.POST, request.FILES,
                       evaluation_type_id=evaluation_type_id)

        if form_followup.is_valid():

            user = request.user
            desc = form_followup.cleaned_data['description']
            subject = form_followup.cleaned_data['subject']
            context = form_followup.cleaned_data['Context']
            
            try:
                fw_lt = evaluation.followup_set.latest()
                status = fw_lt.status
            except Exception:
                status = Status.objects.get(pk=1)

            fw_nw = Followup(evaluation=evaluation, status=status, context=context,
                description=desc, subject=subject,
                reported_by=user, to_user=user,)

            forms_media = MediaInlineSet(request.POST, request.FILES,
                         instance=fw_nw)

            fw_nw.save()
            
            if forms_media.is_valid():
                forms_media.save()

        return HttpResponseRedirect(evaluation.get_absolute_url())
    else:

        evaluation_type_id = {'id': evaluation.type}
        
        #create the form for Followup
        form_followup = FollowupParcForm(evaluation_type_id=evaluation_type_id)

        #object NAMEInLineSet
        #about http://docs.djangoproject.com/en/dev/topics/forms/modelforms/
        MediaInlineSet = inlineformset_factory(Followup, Media, extra=3,
        can_delete=False)

        #create the form for Media
        forms_media = MediaInlineSet()
        
        forms = dict(form_followup=form_followup, forms_media=forms_media,
                                mode = 'newiteration', evaluation=evaluation)
                                
        return render_to_response('evaluations/new_iteration.html', forms, 
                                context_instance=RequestContext(request))


#class to represent the form
class FollowupParcBForm(forms.Form):

    journal_title = forms.CharField(label=_('Journal Title'), required=True,
                max_length=256,widget=forms.TextInput(attrs={'size':'50',}))

    institution = forms.CharField(label=_('Institution'), required=True,
                max_length=512, widget=forms.TextInput(attrs={'size':'40',}))

    issn = forms.CharField(label=_('ISSN'), required=True, max_length=9,
                               widget=forms.TextInput(attrs={'size':'10',}))

    process = forms.ModelChoiceField(label=_('Process'), required=True,
                                            queryset=Type.objects.all())

    description = forms.CharField(label=_('Description'), required=True,
                    widget=forms.Textarea(attrs={'rows':'15','cols':'70',}))

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

