from django.db import models
from django.contrib.auth.models import User
from django.utils.translation import ugettext_lazy as _

from datetime import datetime

import choices

class Type(models.Model):
    type_name = models.CharField(_('Processo'), max_length=256,)

    def __unicode__(self):
        return u'%s' % (self.type_name)

class Context(models.Model):
    type = models.ForeignKey(Type, related_name="context_type", null=True,
                                            blank=True, db_index=True,)
    context_name = models.CharField(_('Context'), max_length=256,)

    def __unicode__(self):
        return u'%s' % (self.context_name)

class Status(models.Model):
    type = models.ForeignKey(Type, related_name="status_type", null=True,
                                            blank=True, db_index=True,)
    status_name = models.CharField(_('Status'), max_length=256,)

    def __unicode__(self):
        return u'%s' % (self.status_name)

class Evaluation(models.Model):
    class Meta:
        ordering = ['-created']

    creator = models.ForeignKey(User, related_name='evaluation_creator', editable=False,)

    type = models.ForeignKey(Type, related_name="evaluation_type", null=False,
                          blank=True, db_index=True,)

    created = models.DateTimeField(_('Date of Registration'), default=datetime.now,
                              editable=False,)

    institution = models.CharField(_('Institution'), max_length=512,)

    issn = models.CharField(_('ISSN'), max_length=9,)

    journal_title = models.CharField(_('Journal Title'), max_length=256,
                                 db_index=True)

    description = models.TextField(_('Description'), max_length=2000, )

    @models.permalink
    def get_absolute_url(self):
        return ('evaluation.history', [str(self.id)])


    def __unicode__(self):
        return u'%s' % (self.journal_title)

    def save(self):
        self.updated = datetime.now()
        super(Evaluation, self).save()

    def opened_evaluations(self):
        ''' return set of Followups related to this evaluation with a
            status = new or open
        '''
        return (r.followup for r in
                self.followup_set.filter(status="new").select_related())

    def is_closed(self):
        ''' return a boolean if the evaluation is already close
        '''
        fw = self.followup_set.latest()
        return fw.status == "closed"

    def is_resolved(self):
        ''' return a boolean if the evaluation is already resolved
        '''
        fw = self.followup_set.latest()
        return fw.status == "resolved"

    def reopen(self):
        fw = self.followup_set.latest()
        fw.status = "reopened"
        return fw.status == "closed"

    def closed_evaluations(self):
        ''' return set of Followups related to this evaluation with a
            status = close
        '''
        return (r.followup for r in
                self.followup_set.filter(status="close").select_related())

class Followup(models.Model):
    evaluation = models.ForeignKey(Evaluation, db_index=True)

    iteration_date = models.DateTimeField(_('Date of Iteration'), db_index=True,
        editable=False, )

    subject = models.CharField(_('Subject'), max_length=256, db_index=True)

    description = models.TextField(_('Description'), max_length=2000, )

    reported_by = models.ForeignKey(User, related_name='evaluation_reported_by',
        editable=False, null=True, blank=True, db_index=True,)

    to_user = models.EmailField(_('To User (e-mail)'), max_length=256, db_index=True,
        editable=False, null=True, blank=True )

    status = models.ForeignKey(Status, related_name="followup_status", null=True,
                          blank=True, db_index=True,)

    context = models.ForeignKey(Context, related_name="followup_context", null=False,
                            blank=True, db_index=True,)

    def __unicode__(self):
        return u'%s' % (self.id)

    class Meta:
        get_latest_by = 'iteration_date'

    def save(self):
        self.iteration_date = datetime.now()
        super(Followup, self).save()


class Media(models.Model):
    followup = models.ForeignKey(Followup, related_name="evaluation_media", null=True,
        blank=True, db_index=True, )
    file = models.FileField(_('Upload File'), blank=True,
        upload_to='files', )
