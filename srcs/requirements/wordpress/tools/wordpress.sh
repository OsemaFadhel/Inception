#!/bin/sh

if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else

	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

mariadb sleep 10

wp config create	--allow-root \
					--dbname=$db_name \
					--dbuser=$db_user \
					--dbpass=$db_password \
					--dbhost=mariadb:3306
					--path='/var/www/wordpress'

wp core install	--allow-root \
				--url=$DOMAIN_NAME \
				--title=$title \
				--admin_user=$wp_admin \
				--admin_password=$wp_admin_password \
				--admin_email=$wp_admin_email \
				--path='/var/www/wordpress'

/usr/sbin/php-fpm7.3 -F
