#!/bin/sh

python manage.py makemigrations --no-input

python manage.py migrate --no-input
python manage.py collectstatic --no-input --clear

gunicorn testBranch.wsgi:application --bind 0.0.0.0:8000

python manage.py makemigrations --no-input

python manage.py migrate --no-input