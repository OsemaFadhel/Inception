#!/bin/sh

sleep 10

sed -i 's/;clear_env = no/clear_env = no/' /etc/php/7.4/fpm/pool.d/www.conf
sed -i 's/listen = .*/listen = wordpress:9000/' /etc/php/7.4/fpm/pool.d/www.conf

wp config create	--allow-root \
					--dbname=$DB_NAME \
					--dbuser=$DB_USER \
					--dbpass=$DB_PASSWORD \
					--dbhost=mariadb:3306 \
					--path='/var/www/wordpress'

wp core install	--allow-root \
				--url=$DOMAIN_NAME \
				--title=$WP_TITLE \
				--admin_user=$WP_ADMIN \
				--admin_password=$WP_ADMIN_PASSWORD \
				--admin_email=$WP_ADMIN_EMAIL \
				--path='/var/www/wordpress'

fi

/usr/sbin/php-fpm7.4 -F
