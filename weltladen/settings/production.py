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

if DEBUG is True:
    raise EnvironmentError('Production not configured! -> https://stackoverflow.com/questions/25076295/gunicorn-environment-variable-setting')
