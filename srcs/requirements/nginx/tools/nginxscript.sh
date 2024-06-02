#!/bin/sh

openssl req -x509 -nodes -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/CN=${DOMAIN_NAME}/UID=${USER}"

sed -i "s/domain_name/${DOMAIN_NAME}/g" "/etc/nginx/sites-available/nginx.conf"

nginx -g "daemon off;"
