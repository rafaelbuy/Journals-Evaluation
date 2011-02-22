# -*- encoding: utf-8 -*-
# Django settings for SciELO Evaluation project.

import os
gettext = lambda s: s

DEBUG = True
TEMPLATE_DEBUG = DEBUG
PROJECT_PATH = os.path.abspath(os.path.dirname(__file__))
SITE_ROOT = os.path.dirname(os.path.abspath(__file__)) 

LOCALE_PATHS = (     
    os.path.join(PROJECT_PATH, 'locale')
)

ADMINS = (
    ('Fabio Batalha', 'fabio.batalha@scielo.org'),
    ('Jamil Atta', 'jamil.atta@scielo.org'),
)

MANAGERS = ADMINS

DATABASES = {
    'default': {
        'ENGINE': 'mysql', # Add 'postgresql_psycopg2', 'postgresql', 'mysql', 'sqlite3' or 'oracle'.
        'NAME': 'evaluation',                      # Or path to database file if using sqlite3.
        'USER': 'root',                      # Not used with sqlite3.
        'PASSWORD': '',                  # Not used with sqlite3.
        'HOST': 'localhost',                      # Set to empty string for localhost. Not used with sqlite3.
        'PORT': '3306',                      # Set to empty string for default. Not used with sqlite3.
    }
}

# Local time zone for this installation. Choices can be found here:
# http://en.wikipedia.org/wiki/List_of_tz_zones_by_name
# although not all choices may be available on all operating systems.
# On Unix systems, a value of None will cause Django to use the same
# timezone as the operating system.
# If running in a Windows environment this must be set to the same as your
# system time zone.
TIME_ZONE = 'America/Brasilia'

# Language code for this installation. All choices can be found here:
# http://www.i18nguy.com/unicode/language-identifiers.html
LANGUAGE_CODE = 'pt-BR'

SITE_ID = 1

# If you set this to False, Django will make some optimizations so as not
# to load the internationalization machinery.
USE_I18N = True


MANAGED_LANGUAGES_CHOICES = (
	(u'en', gettext(u'English')),
    	(u'es', gettext(u'Español')),
	(u'pt-BR', gettext(u'Portuguese')),
)
TARGET_LANGUAGES = MANAGED_LANGUAGES_CHOICES[1:] # exlude source language
MANAGED_LANGUAGES = [code for code, label in MANAGED_LANGUAGES_CHOICES]

# If you set this to False, Django will not format dates, numbers and
# calendars according to the current locale
USE_L10N = True

# Absolute path to the directory that holds media.
# Example: "/home/media/media.lawrence.com/"
MEDIA_ROOT  = os.path.join(PROJECT_PATH, 'static')
STATIC_ROOT = os.path.join(PROJECT_PATH, 'static')

# URL that handles the media served from MEDIA_ROOT. Make sure to use a
# trailing slash if there is a path component (optional in other cases).
# Examples: "http://media.lawrence.com", "http://example.com/media/"
MEDIA_URL  = '/static/'
STATIC_URL = '/static/'

# URL prefix for admin media -- CSS, JavaScript and images. Make sure to use a
# trailing slash.
# Examples: "http://foo.com/media/", "/media/".
ADMIN_MEDIA_PREFIX = '/static/media/'

# Make this unique, and don't share it with anybody.
SECRET_KEY = '2cwgc1s=80bx7v5y0xr8%u)lxmkkh#4hd$_tt0*(s090qxf_83'

# List of callables that know how to import templates from various sources.
TEMPLATE_LOADERS = (
     'django.template.loaders.filesystem.load_template_source',
     'django.template.loaders.app_directories.load_template_source'
#     'django.template.loaders.eggs.Loader',
)

MIDDLEWARE_CLASSES = (
    'django.middleware.cache.UpdateCacheMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.middleware.locale.LocaleMiddleware',
    'django.contrib.flatpages.middleware.FlatpageFallbackMiddleware',
    'debug_toolbar.middleware.DebugToolbarMiddleware',
    'django.middleware.cache.FetchFromCacheMiddleware',

)

ROOT_URLCONF = 'evaluation.urls'
ACCOUNT_ACTIVATION_DAYS = 2
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 587
EMAIL_HOST_USER = 'suporte.aplicacao@scielo.org'
EMAIL_HOST_PASSWORD = 'iPhepae2'
DEFAULT_FROM_EMAIL = 'suporte.aplicacao@scielo.org'
EMAIL_USE_TLS = True
LOGIN_REDIRECT_URL = '/evaluation'


TEMPLATE_DIRS = (
    # Put strings here, like "/home/html/django_templates" or "C:/www/django/templates".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
    os.path.join(PROJECT_PATH, 'templates'),
)


INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.messages',
    'django.contrib.admin',
    'django.contrib.admindocs',
    'django.contrib.flatpages',
    'evaluations',
    'registration',
    'rosetta',
    'debug_toolbar',
    )

TEMPLATE_CONTEXT_PROCESSORS =(
    'django.core.context_processors.auth',
    'django.core.context_processors.i18n',
    'django.core.context_processors.csrf',
    'django.core.context_processors.media',
    'django.core.context_processors.request',
)

FIXTURE_DIRS = ('fixtures',)

INTERNAL_IPS = ('127.0.0.1',)

#Debug Toolbar

DEBUG_TOOLBAR_CONFIG = {'INTERCEPT_REDIRECTS': False}

#Cache

CACHE_BACKEND = "memcached://127.0.0.1:11211/?timeout=60"

CACHE_MIDDLEWARE_ANONYMOUS_ONLY = True 
