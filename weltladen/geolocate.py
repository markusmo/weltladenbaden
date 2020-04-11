# -*- coding: utf-8 -*-
from geopy import distance
from geopy.geocoders import Nominatim

from weltladen.models import Locations
from weltladen.settings import SHOP_APP_LABEL, WELTLADEN_BADEN_LOCATION

def checkdistance(address):
    if not Locations.objects.exists(zip_code=address.zip_code, country=address.country):
        geolocator = Nominatim(SHOP_APP_LABEL+'_baden')
        location_str = '{0} {1}, {2}'.format(address.zip_code, address.city, address.country)
        geocode = geolocator.gecode(location_str)

        other_city = (geocode.latitude, gecode.longitude)
        d = distance.distance(WELTLADEN_BADEN_LOCATION, other_city).km

        location = Location.objects.create(
            zip_code=address.zip_code,
            city=address.city,
            country=address.country,
            distance=round(d)
        )
        location.save()
    location = Locations.objects.get(zip_code=address.zip_code, country=address.country)
    return location.distance
