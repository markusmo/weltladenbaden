# -*- coding: utf-8 -*-
from geopy import distance
from geopy.geocoders import Nominatim

from weltladen.models import Locations
from weltladen.settings import SHOP_APP_LABEL, WELTLADEN_BADEN_LOCATION

def checkdistance(zip_code, city, country):
    '''
    see https://geopy.readthedocs.io/en/stable/#module-geopy.geocoders
    '''
    if not Locations.objects.filter(zip_code=zip_code, country=country).exists():
        geolocator = Nominatim(SHOP_APP_LABEL+'_baden')
        location_str = {
            'postalcode': zip_code,
            'city': city,
            'country': country
        }

        geocode = geolocator.geocode(location_str)

        other_city = (geocode.latitude, geocode.longitude)
        d = distance.distance(WELTLADEN_BADEN_LOCATION, other_city).km

        location = Locations.objects.create(
            zip_code=zip_code,
            city=city,
            country=country,
            distance=round(d)
        )
        location.save()
    location = Locations.objects.get(zip_code=zip_code, country=country)
    return location.distance
