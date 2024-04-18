FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY conf/configuration /etc/mysql/mariadb.conf.d/configuration

EXPOSE 3306

RUN [ "tools/mariadbscript.sh" ]

CMD ["mariadb"]
