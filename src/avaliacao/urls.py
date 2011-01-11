from django.conf.urls.defaults import *
from django.contrib.auth.views import password_reset, password_reset_done
from avaliacao.tickets.views import index
from django.contrib import admin

admin.autodiscover()

urlpatterns = patterns('',

    # Uncomment the admin/doc line below to enable admin documentation:
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),

    # Tickets application
    url(r'^ticket/', include('avaliacao.tickets.urls')),

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
        
    url(r'^$', index, name="avaliacao.ticket.index"),

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