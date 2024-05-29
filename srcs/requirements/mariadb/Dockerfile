FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY conf/configuration.cnf /etc/mysql/mariadb.conf.d/configuration.cnf

EXPOSE 3306

COPY tools/mariadbscript.sh mariadbs.sh

CMD ["mariadbs.sh"]
