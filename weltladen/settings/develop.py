# -*- coding: utf-8 -*-
from .base import *

# SECURITY WARNING: in production, inject the secret key through the environment
SECRET_KEY = os.environ.get(
    'DJANGO_SECRET_KEY', '75lHXSVhpVrMW0v7bFvYX9WoWAaUJ7muW4jh3j9AJHUgfFQY3aGRCVDdotQ4Kt6H')

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['*']

INSTALLED_APPS.extend(['django_extensions', ])

SHOP_SENDCLOUD = {
    'API_KEY': '38154347dcfc436287e432ed84bc3ed3',
    'API_SECRET': 'e4ccd483fa3548f6a92fcc901fc79d32',
}

CMSPLUGIN_CASCADE['leaflet'] = {
    'tilesURL': 'https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}',
    'accessToken': 'pk.eyJ1IjoibWFya3VzbW8iLCJhIjoiY2s5NzZtdWZwMGV6azNocnNrYmRjc2ltciJ9.gn39wNwba9Y01rvSlXpiaw',
    'apiKey': 'AIzaSyD71sHrtkZMnLqTbgRmY_NsO0A9l9BQmv4'
}
