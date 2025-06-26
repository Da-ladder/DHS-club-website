#!/bin/sh

python manage.py makemigrations --noinput

python manage.py migrate --noinput
python manage.py collectstatic --noinput --clear

# gunicorn testBranch.wsgi:application --bind 0.0.0.0:8000

daphne -b 0.0.0.0 -p 8000 testBranch.asgi:application

# python manage.py makemigrations --no-input

# python manage.py migrate --no-input