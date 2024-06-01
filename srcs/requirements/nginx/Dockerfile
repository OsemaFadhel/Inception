FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y nginx

RUN mkdir -p /etc/nginx/ssl

RUN apt install -y openssl

RUN openssl req -x509 -nodes -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/CN=ofadhel.42.fr"

COPY /conf/configuration /etc/nginx/sites-available/nginx.conf

RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

RUN chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]
