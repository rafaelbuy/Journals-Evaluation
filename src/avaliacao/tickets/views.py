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

from avaliacao.tickets.models import Ticket, Followup, Media, Type, Context, Status

import choices


def index(request):
    t = loader.get_template('tickets/home_tickets.html')
    c = RequestContext(request)
    return HttpResponse(t.render(c))

def user_logout(request):
    logout(request)
    t = loader.get_template('tickets/home_tickets.html')
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
                t = loader.get_template('tickets/home_tickets.html')
                c = RequestContext(request,{
                'active': True,})
                return HttpResponse(t.render(c))
        else:
            t = loader.get_template('tickets/home_tickets.html')
            c = RequestContext(request,{
            'invalid': True, 'next': next})
            return HttpResponse(t.render(c))
    else:
        t = loader.get_template('tickets/home_tickets.html')
        c = RequestContext(request, {'next': next})
        return HttpResponse(t.render(c))

@login_required
def user_index(request):
    user_tickets = Ticket.objects.filter(creator=request.user)[:20]
    user_open_tickets  = (i.opened_tickets() for i in Ticket.objects.all())
    user_close_tickets = (i.closed_tickets() for i in Ticket.objects.all())
    request.session['count_tickets_user'] = Ticket.objects.filter(creator=request.user).count()
    
    t = loader.get_template('tickets/user_tickets.html')
    c = RequestContext(request, {
        'user_tickets': user_tickets,
        'user_open_tickets': user_open_tickets,
        'choices': choices,
        'user_close_tickets': user_close_tickets,
    })
    return HttpResponse(t.render(c))


def get_context(request, type_id):
    contexts = Context.objects.filter(type=type_id)
    retorno = serializers.serialize("json", contexts)
    return HttpResponse(retorno, mimetype="text/javascript")

@login_required
def waiting_acceptance(request):
    fw_waiting = Followup.objects.filter(status = 'new', ticket__type='review')
    t = loader.get_template('tickets/waiting_acceptance_tickets.html')
    c = RequestContext(request, {
        'fw_waiting': fw_waiting,
        'choices': choices,
        'username': request.user.username,
    })
    return HttpResponse(t.render(c))


@login_required
def reopen_ticket(request, object_id):
    ticket = get_object_or_404(Ticket, id=int(object_id))
    followup_latest = ticket.followup_set.latest()
    followup_new = Followup(ticket=ticket, status='reopened',
                  description=followup_latest.description,
                  subject=followup_latest.subject,
                  reported_by=followup_latest.reported_by )
    followup_new.save();

    return HttpResponseRedirect(ticket.get_absolute_url())

@login_required
def close_ticket(request, object_id):
    ticket = get_object_or_404(Ticket, id=int(object_id))
    followup_latest = ticket.followup_set.latest()
    followup_new = Followup(ticket=ticket, status='closed',
                 description=followup_latest.description,
                 subject=followup_latest.subject,
                 reported_by=followup_latest.reported_by )
    followup_new.save();

    return HttpResponseRedirect(ticket.get_absolute_url())


@login_required
def resolve_ticket(request, object_id):
    ticket = get_object_or_404(Ticket, id=int(object_id))
    if request.method == 'POST': # If the forms were submitted...
        form = FollowupParcForm(request.POST)
        if form.is_valid():
            desc = form.cleaned_data['description']
            fw_lt = ticket.followup_set.latest()
            fw_nw = Followup(ticket=ticket, status='resolved',
                description=desc, subject=fw_lt.subject ,
                reported_by=fw_lt.reported_by, to_user=fw_lt.to_user, )
            fw_nw.save()
            
        return HttpResponseRedirect(ticket.get_absolute_url())
    else:
        form = FollowupParcForm()
        forms = dict(form_followup=form, mode = 'resolve', ticket=ticket,
        username=request.user.username)
        return render_to_response('tickets/new_iteration.html', forms,
                                context_instance=RequestContext(request))

@login_required
def accept_ticket(request, object_id):
    if request.method == 'POST': # If the forms were submitted...
        form = FollowupParcForm(request.POST)
        if form.is_valid():
            user =  request.user
            desc = form.cleaned_data['description']
            ticket = get_object_or_404(Ticket, id=int(object_id))
            fw_lt = ticket.followup_set.latest()
            fw_nw = Followup(ticket=ticket, status='accepted',
                description=desc, subject=fw_lt.subject ,
                reported_by=fw_lt.reported_by, to_user=user, )
            fw_nw.save()

        return HttpResponseRedirect(ticket.get_absolute_url())
    else:
        # recovering Ticket Data to input form fields
        followup_form = FollowupParcForm() # An unbound form
        return render_to_response('tickets/new_iteration.html', {
            'iteration_form': followup_form,
            'ticket_id': object_id,
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
        type = kwargs.pop('ticket_type_id', None)
        super(FollowupParcForm, self).__init__(*args, **kwargs)
        if type:
            self.fields['Context'].queryset = Context.objects.filter(
                                           type=type['id'])
@login_required
def new_iteration(request, object_id):
    
    #get the ticket by id or 404 error
    ticket = get_object_or_404(Ticket, id=int(object_id))

    #check method POST
    if request.method == 'POST':

        #create the set of media
        MediaInlineSet = inlineformset_factory(Followup, Media, extra=3)

        ticket_type_id = {'id': ticket.type}

        form_followup = FollowupParcForm(request.POST, request.FILES,
                       ticket_type_id=ticket_type_id)

        if form_followup.is_valid():

            user = request.user
            desc = form_followup.cleaned_data['description']
            subject = form_followup.cleaned_data['subject']
            context = form_followup.cleaned_data['Context']
            
            try:
                fw_lt = ticket.followup_set.latest()
                status = fw_lt.status
            except Exception:
                status = Status.objects.get(pk=1)

            fw_nw = Followup(ticket=ticket, status=status, context=context,
                description=desc, subject=subject,
                reported_by=user, to_user=user,)

            forms_media = MediaInlineSet(request.POST, request.FILES,
                         instance=fw_nw)

            fw_nw.save()
            
            if forms_media.is_valid():
                forms_media.save()

        return HttpResponseRedirect(ticket.get_absolute_url())
    else:

        ticket_type_id = {'id': ticket.type}
        
        #create the form for Followup
        form_followup = FollowupParcForm(ticket_type_id=ticket_type_id)

        #object NAMEInLineSet
        #about http://docs.djangoproject.com/en/dev/topics/forms/modelforms/
        MediaInlineSet = inlineformset_factory(Followup, Media, extra=3,
        can_delete=False)

        #create the form for Media
        forms_media = MediaInlineSet()
        
        forms = dict(form_followup=form_followup, forms_media=forms_media,
                                mode = 'newiteration', ticket=ticket)
                                
        return render_to_response('tickets/new_iteration.html', forms, 
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
def open_ticket(request):

    if request.method == 'POST':

        #instance of form
        form = FollowupParcBForm(request.POST, request.FILES)
        
        if form.is_valid():
            
            #Get the user and create a new ticket
            user = request.user
            institution = form.cleaned_data['institution']
            issn = form.cleaned_data['issn']
            journal_title = form.cleaned_data['journal_title']
            process = form.cleaned_data['process']
            description = form.cleaned_data['description']
            
            ticket = Ticket(type=process, creator=user, institution=institution,
                    issn=issn, journal_title=journal_title,
                    description=description)
            ticket.save()

            return HttpResponseRedirect(ticket.get_absolute_url())
        else:
             
             open_ticket_form = FollowupParcBForm() # An unbound form
            
             return render_to_response('tickets/open_ticket.html', {
                'open_ticket_form': open_ticket_form,
                'type': type,
                'mode': 'open_ticket',
                'form': form,
                'user_name': request.user.pk},
                context_instance=RequestContext(request))
    else:

        #recovering Ticket Data to input form fields
        open_ticket_form = FollowupParcBForm() # An unbound form

    return render_to_response('tickets/open_ticket.html', {
        'open_ticket_form': open_ticket_form,
        'type': type,
        'mode': 'open_ticket',
        'user_name': request.user.pk},
        context_instance=RequestContext(request))

