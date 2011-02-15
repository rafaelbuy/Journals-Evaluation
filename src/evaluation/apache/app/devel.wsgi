import os, sys
sys.path.append('/var/www/evaluation_scielo_br/app/src')
sys.path.append('/var/www/evaluation_scielo_br/app/src/evaluation')
os.environ['DJANGO_SETTINGS_MODULE'] = 'evaluation.settings'

import django.core.handlers.wsgi

application = django.core.handlers.wsgi.WSGIHandler()
