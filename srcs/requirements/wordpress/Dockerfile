FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y php7.4 \
		php7.4-mysql \
		php7.4-intl \
		php7.4-curl \
		php7.4-mbstring \
		php7.4-xml \
		php7.4-zip \
		php7.4-ldap \
		php7.4-gd \
		php7.4-bz2 \
		php7.4-sqlite3 \
		php7.4-redis \
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

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

CMD ["tools/wordpress.sh"]

