#!/bin/bash
echo 'we are sapporo'
python3 ./manage.py migrate

sh -c "while : ; do python manage.py runserver_plus 0.0.0.0:8000; done"

echo exec: "${@}"
exec "${@}"
