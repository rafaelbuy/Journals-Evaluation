from django.conf.urls.defaults import *
from django.contrib.auth.decorators import login_required
from django.views.generic.list_detail import object_detail, object_list
from evaluations.models import Evaluation
from evaluations.views import *

info_dict = {
    'queryset': Evaluation.objects.all(),
}

urlpatterns = patterns('',
    url(r'^$', user_index, name="evaluation.user_index"),
    url(r'^open/$', open_evaluation, name='evaluation.open' ),
    url(r'^search/$', search, name="evaluation.search"),
    url(r'^list/$', login_required(object_list), info_dict, name="evaluation.list"),
    url(r'^history/(?P<object_id>\d+)/$', login_required(object_detail), info_dict, name='evaluation.history' ),
    url(r'^newiteration/(?P<object_id>\d+)/$', new_iteration, name='evaluation.new_iteration' ),
)
