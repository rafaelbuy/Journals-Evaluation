INSTALL_BASE = '/var/www/evaluation_scielo_br/app/src'

PROJECT_NAME = 'evaluation'
import os, sys
sys.path.append(os.path.join(INSTALL_BASE,PROJECT_NAME))
sys.path.append(INSTALL_BASE)
os.environ['DJANGO_SETTINGS_MODULE'] = PROJECT_NAME+'.settings'

import django.core.handlers.wsgi

application = django.core.handlers.wsgi.WSGIHandler()

