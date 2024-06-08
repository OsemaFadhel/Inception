#!/bin/sh

openssl req -x509 -nodes -keyout ${KEYS} -out ${CERTS} -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=${DOMAIN_NAME}/UID=${USER}"

sed -i "s/domain_name/${DOMAIN_NAME}/g" "/etc/nginx/nginx.conf"

nginx -g "daemon off;"
