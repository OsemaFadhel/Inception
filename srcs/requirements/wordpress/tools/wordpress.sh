#!/bin/sh

sleep 30

cd /var/www/html

wp config create	--allow-root \
					--dbname=$DB_NAME \
					--dbuser=$DB_USER \
					--dbpass=$DB_PASSWORD \
					--dbhost=mariadb:3306 \
					--path='/var/www/html'

wp core install	--allow-root \
				--url=$DOMAIN_NAME \
				--title=$WP_TITLE \
				--admin_user=$WP_ADMIN \
				--admin_password=$WP_ADMIN_PASSWORD \
				--admin_email=$WP_ADMIN_EMAIL \
				--skip-email \
				--path='/var/www/html' \

wp theme install hestia --activate --path="/var/www/html"


wp user create	$WP_USER \
				$WP_USER_EMAIL \
				--role=author \
				--user_pass=$WP_USER_PASSWORD \
				--path='/var/www/html' \
				--allow-root

/usr/sbin/php-fpm7.4 -F
