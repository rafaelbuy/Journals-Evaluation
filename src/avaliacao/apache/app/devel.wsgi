import os, sys
sys.path.append('/home/jamilatta/project/evaluation/src')
sys.path.append('/home/jamilatta/project/evaluation/src/avaliacao')
os.environ['DJANGO_SETTINGS_MODULE'] = 'avaliacao.settings'

import django.core.handlers.wsgi

application = django.core.handlers.wsgi.WSGIHandler()
