FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y mariadb-server

COPY conf/configuration.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

COPY tools/mariadbscript.sh /usr/local/bin/mariadbscript.sh

RUN chmod +x /usr/local/bin/mariadbscript.sh

CMD ["/usr/local/bin/mariadbscript.sh"]
