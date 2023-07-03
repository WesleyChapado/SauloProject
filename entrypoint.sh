#!/bin/sh

python manage.py makemigrations
python manage.py migrate

# Carregar a senha do superusuário do arquivo .env
export DJANGO_SUPERUSER_PASSWORD=$(grep -oP 'DJANGO_SUPERUSER_PASSWORD=\K.*' .env)

# Criar o superusuário
python manage.py createsuperuser \
    --noinput \
    --username wesleychapado \
    --email wesley-chapado@hotmail.com \
    --password ${DJANGO_SUPERUSER_PASSWORD}

exec "$@"