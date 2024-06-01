FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y php8.2 \
		php8.2-mysql \
		php8.2-intl \
		php8.2-curl \
		php8.2-mbstring \
		php8.2-xml \
		php8.2-zip \
		php8.2-ldap \
		php8.2-gd \
		php8.2-bz2 \
		php8.2-sqlite3 \
		php8.2-redis \
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

