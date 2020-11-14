# -*- coding: utf-8 -*-

from django.conf import settings
from geopy import distance
from geopy.geocoders import TomTom
from weltladen.models import Locations


def checkdistance(zip_code, city, country):
    '''
    see https://geopy.readthedocs.io/en/stable/#module-geopy.geocoders
    '''
    if not Locations.objects.filter(zip_code=zip_code, country=country).exists():
        geolocator = TomTom(api_key=settings.TOMTOM_APIKEY)
        location_str = {
            'postalcode': zip_code,
            'city': city,
            'country': country
        }

        geocode = geolocator.geocode('{city} {postalcode} {country}'.format(**location_str))

        other_city = (geocode.latitude, geocode.longitude)
        d = distance.distance(settings.WELTLADEN_BADEN_LOCATION, other_city).km

        location = Locations.objects.create(
            zip_code=zip_code,
            city=city,
            country=country,
            distance=round(d)
        )
        location.save()
    location = Locations.objects.get(zip_code=zip_code, country=country)
    return location.distance
