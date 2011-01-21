import os, sys
sys.path.append('/var/www/evaluation_scielo_br/app/src')
sys.path.append('/var/www/evaluation_scielo_br/app/src/avaliacao')
os.environ['DJANGO_SETTINGS_MODULE'] = 'avaliacao.settings'

import django.core.handlers.wsgi

application = django.core.handlers.wsgi.WSGIHandler()
