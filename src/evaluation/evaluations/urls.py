from django.conf.urls.defaults import *
from django.views.generic.list_detail import object_detail, object_list
from evaluations.models import Evaluation
from evaluations.views import *

info_dict = {
    'queryset': Evaluation.objects.all(),
}

urlpatterns = patterns('',
    url(r'^$', user_index, name="evaluation.user_index"),
    url(r'^search/$', search, name="evaluation.search"),
    url(r'^list/$', object_list, info_dict, name="evaluation.list"),
    url(r'^history/(?P<object_id>\d+)/$', object_detail, info_dict, name='evaluation.history' ),
    url(r'^open/$', open_evaluation, name='evaluation.open' ),
    url(r'^reopen/(?P<object_id>\d+)/$', reopen_evaluation, name='evaluation.reopen' ),
    url(r'^resolve/(?P<object_id>\d+)/$', resolve_evaluation, name='evaluation.resolve' ),
    url(r'^accept/(?P<object_id>\d+)/$', accept_evaluation, name='evaluation.accept' ),
    url(r'^close/(?P<object_id>\d+)/$', close_evaluation, name='evaluation.close' ),
    url(r'^newiteration/(?P<object_id>\d+)/$', new_iteration, name='evaluation.new_iteration' ),
    url(r'^get_context/(?P<type_id>\d+)/$', get_context, name="evaluation.get_context"),
)
