#!/bin/sh

sleep 15

cd /var/www/wordpress

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
				--skip-email \
				--path='/var/www/wordpress' \

/usr/sbin/php-fpm7.4 -F
