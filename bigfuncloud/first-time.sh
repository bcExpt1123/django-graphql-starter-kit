#!/bin/bash

set -ex

direnv allow
eval "$(direnv export bash)"

pip3 install -r ./requirements.txt

django-admin startproject @BFC_PYTHON_IDENTIFIER@ .
django-admin startapp backend

mv ./overlay/project/* ./@BFC_PYTHON_IDENTIFIER@
mv ./overlay/backend/* ./backend
rm -rf ./overlay

./manage.py makemigrations
./manage.py migrate
