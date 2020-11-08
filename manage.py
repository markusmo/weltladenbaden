#!/usr/bin/env python
import os
import sys
from dotenv import load_dotenv

#https://help.pythonanywhere.com/pages/environment-variables-for-web-apps/
#load environment
project_folder = os.path.expanduser('~/django_project')
load_dotenv(os.path.join(project_folder, '.env'))

if __name__ == '__main__':
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'weltladen.settings.develop')

    from django.core.management import execute_from_command_line

    execute_from_command_line(sys.argv)
