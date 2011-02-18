# -*- coding: utf-8 -*-

from django.contrib import admin
from evaluation.evaluations.models import *

class MediaInline(admin.StackedInline):
    model = Media

class FollowupInline(admin.StackedInline):
    model = Followup
    
class TypeInline(admin.StackedInline):
    model = Type
    
class ContextInline(admin.StackedInline):
    model = Type
    
class StatusInline(admin.StackedInline):
    model = Status

class MeetingInline(admin.StackedInline):
    model = Meeting
    
class MediaAdmin(admin.ModelAdmin):
    list_display = ('file', )

class FollowupAdmin(admin.ModelAdmin):
    list_display = ('reported_by','subject','status','iteration_date', )
    list_display_links = ('subject', )
    inlines = [MediaInline]

    def save_model(self, request, instance, form, change):
        instance.reported_by = request.user
        super(FollowupAdmin, self).save_model(request, instance, form, change)

class TypeAdmin(admin.ModelAdmin):
    pass

class ContextAdmin(admin.ModelAdmin):
    pass

class StatusAdmin(admin.ModelAdmin):
    pass

class MeetingAdmin(admin.ModelAdmin):
    pass

class EvaluationAdmin(admin.ModelAdmin):
    #list_display = ('created','context','creator')
    #$list_display_links = ('context',)
    #search_fields = ('context',)
    list_display = ('issn', 'creator', 'created')
    inlines = [FollowupInline]

    def save_model(self, request, instance, form, change):
        instance.creator = request.user

        super(EvaluationAdmin, self).save_model(request, instance, form, change)

if Evaluation not in admin.site._registry:
    admin.site.register(Evaluation, EvaluationAdmin)

if Followup not in admin.site._registry:
    admin.site.register(Followup, FollowupAdmin)

if Media not in admin.site._registry:
    admin.site.register(Media, MediaAdmin)

if Type not in admin.site._registry:
    admin.site.register(Type, TypeAdmin)

if Context not in admin.site._registry:
    admin.site.register(Context, ContextAdmin)
    
if Status not in admin.site._registry:
    admin.site.register(Status, StatusAdmin)

if Meeting not in admin.site._registry:
    admin.site.register(Meeting, MeetingAdmin)

