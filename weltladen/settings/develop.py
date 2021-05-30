# -*- coding: utf-8 -*-
from .base import *

# SECURITY WARNING: in production, inject the secret key through the environment
SECRET_KEY = os.environ.get(
    'DJANGO_SECRET_KEY', '75lHXSVhpVrMW0v7bFvYX9WoWAaUJ7muW4jh3j9AJHUgfFQY3aGRCVDdotQ4Kt6H')

ALLOWED_HOSTS = ['*']

INSTALLED_APPS.extend(['django_extensions', ])

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