# -*- coding: utf-8 -*-
from .base import *

# SECURITY WARNING: in production, inject the secret key through the environment
SECRET_KEY = os.environ.get(
    'DJANGO_SECRET_KEY', 'n/a')

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['someURL']

SHOP_SENDCLOUD = {
    'API_KEY': 'n/a',
    'API_SECRET': 'n/a',
}

CMSPLUGIN_CASCADE['leaflet'] = {
    'tilesURL': 'https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}',
    'accessToken': 'n/a',
    'apiKey': 'n/a'
}

if DEBUG is True:
    raise EnvironmentError('Production not configured!')
