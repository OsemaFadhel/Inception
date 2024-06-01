FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y php8.2 \
		php-fpm \
		php-cgi \
		php-mysql \
		php-cli \
		mariadb-client \
		wget

RUN wget https://wordpress.org/wordpress-6.4.3.tar.gz -P /var/www && \
	tar -xvf /var/www/wordpress-6.4.3.tar.gz -C /var/www && \
	rm -rf /var/www/wordpress-6.4.3.tar.gz

RUN chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

COPY tools/wordpress.sh tools/wordpress.sh

RUN chmod +x tools/wordpress.sh

CMD ["tools/wordpress.sh"]

