FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt-get install -y mariadb-server \
	curl

COPY conf/configuration.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/mariadbscript.sh /usr/local/bin/mariadbscript.sh

RUN chmod +x /usr/local/bin/mariadbscript.sh

EXPOSE 3306

CMD ["/usr/local/bin/mariadbscript.sh"]
