#!/bin/sh

openssl req -x509 -nodes -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=${DOMAIN_NAME}/UID=${USER}"

sed -i "s/domain_name/${DOMAIN_NAME}/g" "/etc/nginx/nginx.conf"

nginx -g "daemon off;"
