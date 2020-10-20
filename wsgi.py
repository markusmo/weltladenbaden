import os
from dotenv import load_dotenv
from django.core.wsgi import get_wsgi_application

#https://help.pythonanywhere.com/pages/environment-variables-for-web-apps/
#load environment
project_folder = os.path.expanduser('~/django_project')
load_dotenv(os.path.join(project_folder, '.env'))

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'weltladen.settings.develop')
application = get_wsgi_application()