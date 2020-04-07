#!/bin/bash
set -e

npm install
#/web/manage.py initialize_shop_demo --noinput
/web/manage.py migrate
exec /web/manage.py runserver 0.0.0.0:9009
