FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y mariadb-server \
	curl

COPY conf/configuration.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld

RUN chmod -R 755 /var/run/mysqld

COPY tools/mariadbscript.sh /usr/local/bin/mariadbscript.sh

RUN chmod +x /usr/local/bin/mariadbscript.sh

EXPOSE 3306

CMD ["/usr/local/bin/mariadbscript.sh"]
