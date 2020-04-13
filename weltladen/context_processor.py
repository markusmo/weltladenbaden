from django.conf import settings # import the settings file

def weltladen_settings(request):
    # return the value you want as a dictionnary. you may add multiple values in there.
    return {'ROBOTS_META_TAGS': settings.ROBOTS_META_TAGS}