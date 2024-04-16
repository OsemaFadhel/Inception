FROM debian:bookworm

RUN apt-get update && apt-get install -y nginx

COPY /conf/configuration /etc/nginx/sites-available/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]


