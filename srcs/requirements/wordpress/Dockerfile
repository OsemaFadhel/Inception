FROM debian:bullseye

RUN apt-get update && apt-get install php -y \
		php \
		php-cgi \
		php-mysql \
		php-cli \
		wget \
		curl \
		bash

RUN wget https://wordpress.org/wordpress-6.4.3.tar.gz -P /var/www

RUN tar -xvf /var/www/wordpress-6.4.3.tar.gz -C /var/www

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

#expose 9000

COPY tools/wordpress.sh tools/wordpress.sh

RUN chmod +x tools/wordpress.sh

CMD ["tools/wordpress.sh"]

