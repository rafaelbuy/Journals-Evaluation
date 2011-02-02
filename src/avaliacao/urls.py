from django.conf.urls.defaults import *
from django.contrib.auth.views import password_reset, password_reset_done
from django.contrib.auth.views import password_reset_complete, password_reset_confirm
from avaliacao.tickets.views import index, user_logout, user_login
from django.contrib import admin

admin.autodiscover()

urlpatterns = patterns('',

    url(r'^$', index, name="avaliacao.ticket.index"),

    # Uncomment the admin/doc line below to enable admin documentation:
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),

    # Tickets application
    url(r'^ticket/', include('avaliacao.tickets.urls')),

    url(r'^accounts/logout/$', user_logout, name='tickets.user_logout'),

    url(r'^accounts/login/$', user_login, name='tickets.user_login'),

    # django-registration views
    url(r'^accounts/', include('registration.urls')),

    url(r'^accounts/password/reset/$', password_reset, {
        'template_name': 'registration/password_reset_form.html',
        'email_template_name': 'registration/password_reset_email.html',
        'post_reset_redirect': '/accounts/password/reset/done/'},
        name='registration.password_reset'),
        
    url(r'^accounts/password/reset/done/$', password_reset_done, 
        {'template_name': 'registration/password_reset_done.html'},
        name='registration.password_reset_done'),

    url(r'^accounts/password/reset/(?P<uidb36>[0-9A-Za-z]+)-(?P<token>.+)/$', password_reset_confirm, {
       'template_name': 'registration/password_reset_confirm.html',
        'post_reset_redirect': '/accounts/password/reset/complete/'},
        name='registration.password_reset_confirm'),

    url(r'^accounts/password/reset/complete/$', password_reset_complete,
        {'template_name': 'registration/password_reset_complete.html'},
        name='registration.password_reset_complete'),

    (r'^i18n/', include('django.conf.urls.i18n')),

)

from django.conf import settings

if settings.DEBUG:
    # serve static files from develpment server
    from django.views import static

    urlpatterns += patterns('',
        url(r'^static/(?P<path>.*)$', 'django.views.static.serve',
            {'document_root': settings.MEDIA_ROOT}),
    )

if 'rosetta' in settings.INSTALLED_APPS:
    urlpatterns += patterns('',
        url(r'^rosetta/', include('rosetta.urls')),
    )