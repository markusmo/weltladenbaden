# -*- coding: utf-8 -*-
from .base import *

# SECURITY WARNING: in production, inject the secret key through the environment
SECRET_KEY = os.environ.get('DJANGO_SECRET_KEY')

ALLOWED_HOSTS = ['someURL']

SHOP_SENDCLOUD = {
    'API_KEY': os.environ.get('SENDCLOUD_APIKEY'),
    'API_SECRET': os.environ.get('SENDCLOUD_APISECRET'),
}

CMSPLUGIN_CASCADE['leaflet'] = {
    'tilesURL': 'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
    'accessToken': os.environ.get('LEAFLET_ACCESSTOKEN'),
    'apiKey': os.environ.get('LEAFLET_APIKEY')
}

TOMTOM_APIKEY=os.environ.get('TOMTOM_APIKEY')
GOOGLE_ANALYTICS = os.environ.get('GOOGLE_ANALYTICS')
FACEBOOK_PIXEL = os.environ.get('FACEBOOK_PIXEL')

ROBOTS_META_TAGS = ('index, follow')

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'verbose': {
            'format': '{levelname} {asctime} {module} {process:d} {thread:d} {message}',
            'style': '{',
        },
    },
    'handlers': {
        'django-server': {
            'level': 'WARNING',
            'class': 'logging.handlers.RotatingFileHandler',
            'maxBytes' : 1024*1024*10, # 10MB
            'backupCount' : 10,
            'formatter': 'verbose',
            'filename': '/home/_some_user_/_path_here_/log/debug.log',
        },
        'sql-server': {
            'level': 'WARNING',
            'class': 'logging.handlers.RotatingFileHandler',
            'maxBytes' : 1024*1024*10, # 10MB
            'backupCount' : 10,
            'formatter': 'verbose',
            'filename': '/home/_some_user_/_path_here_/log/sql_debug.log',
        },
    },
    'loggers': {
        'django': {
            'handlers': ['django-server'],
            'level': 'DEBUG',
            'propagate': True,
        },
        'django.db.backends': {
            'handlers': ['sql-server'],
            'level': 'WARNING',   # DEBUG will log all queries, so change it to WARNING.
            'propagate': False,   # Don't propagate to other handlers
        },
    },
}


if DEBUG is True:
    raise EnvironmentError('Production not configured! -> https://stackoverflow.com/questions/25076295/gunicorn-environment-variable-setting')
