FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y nginx \
		openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/CN=ofadhel.42.fr"

COPY /conf/configuration /etc/nginx/sites-available/nginx.conf

RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

RUN chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
