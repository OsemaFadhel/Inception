FROM debian:bullseye

RUN apt -get update && sudo apt-get install php \
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

EXPOSE 9000

COPY /conf/config.php /var/www/config.php

ENTRYPOINT ["tools/wordpress.sh"]

CMD ["bash"]

