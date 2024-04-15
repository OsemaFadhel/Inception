FROM debian:bookworm

RUN apt-get update && apt-get install -y nginx

COPY ./srcs/nginx.conf /etc/nginx/sites-available/default

COPY ./srcs/index.html /var/www/html/

RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 443



