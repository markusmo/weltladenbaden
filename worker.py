#!/usr/bin/env python
import os
import time

import redis
import schedule
from dotenv import load_dotenv

# https://help.pythonanywhere.com/pages/environment-variables-for-web-apps/
# load environment
project_folder = os.path.expanduser('~/django_project')
load_dotenv(os.path.join(project_folder, '.env'))

if __name__ == '__main__':
    from django import setup
    from django.conf import settings
    from django.core.management import call_command
    from django.utils import timezone

    # initialize Django
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'weltladen.settings.develop')
    setup()

    # schedule jobs
    schedule.every().minute.do(call_command, 'send_queued_mail')
    rebuild_at = timezone.now() + timezone.timedelta(minutes=6)
    schedule.every().hour.at(rebuild_at.strftime(':%M')).do(call_command, 'search_index --rebuild', interactive=False)
    schedule.every().monday.do(call_command, 'sendcloud_import')
    schedule.every().sunday.do(call_command, 'shopcustomers', delete_expired=True)

    if hasattr(settings, 'SESSION_REDIS'):
        redis_con = dict((key, settings.SESSION_REDIS[key]) for key in ['host', 'port', 'db', 'socket_timeout'])
        pool = redis.ConnectionPool(**redis_con)
        r = redis.Redis(connection_pool=pool)
        pubsub = r.pubsub()
        pubsub.subscribe('django-SHOP')
    else:
        pubsub = type(str('PubSub'), (), {'get_message': lambda s: None})()

    while True:
        message = pubsub.get_message()
        if message:
            if message['data'] == 'send_queued_mail':
                call_command('send_queued_mail')
        schedule.run_pending()
        time.sleep(1)
