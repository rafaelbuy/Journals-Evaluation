from django.db import models
from django.contrib.auth.models import User
from django.utils.translation import ugettext_lazy as _

from datetime import datetime

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

class Meeting(models.Model):

    def __unicode__(self):
        return u'%s' % (self.title)
     
    title = models.CharField(_('Title'), max_length=256, db_index=True)
    description = models.TextField(_('Description'), max_length=2000, )
    location = models.CharField(_('Location'), max_length=256, null=True,
                               blank=True, db_index=True)
    date = models.DateTimeField(_('Date of Meeting'), db_index=True,)
    url = models.URLField(_('URL'), null=True, blank=True, verify_exists=True)
    
class Evaluation(models.Model):
    class Meta: 
        ordering = ['-created']
        permissions = (("list_all_evaluation", "Can list all evaluation"),
                      ("can_set_status", "Can set status"),
                      ("can_set_meeting", "Can set meeting"))

    creator = models.ForeignKey(User, related_name='evaluation_creator',
                                editable=False,)

    type = models.ForeignKey(Type, related_name="evaluation_type", null=False,
                          blank=True, db_index=True,)
                          
    meeting = models.ForeignKey(Meeting, related_name="evaluation_meeting", null=True,
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

class Followup(models.Model):
    evaluation = models.ForeignKey(Evaluation, db_index=True)

    iteration_date = models.DateTimeField(_('Date of Iteration'), db_index=True,
        editable=False, )

    subject = models.CharField(_('Subject'), max_length=256, db_index=True)

    description = models.TextField(_('Description'), max_length=2000, )

    reported_by = models.ForeignKey(User, related_name='evaluation_reported_by',
        editable=False, null=True, blank=True, db_index=True,)

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

