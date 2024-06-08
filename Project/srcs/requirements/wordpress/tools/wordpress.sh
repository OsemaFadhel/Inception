#!/bin/sh

sleep 30

cd /var/www/html

if [ ! -f wp-config.php ]; then

  wp config create --allow-root \
                   --dbname=$DB_NAME \
                   --dbuser=$DB_USER \
                   --dbpass=$DB_PASSWORD \
                   --dbhost=mariadb:3306 \
                   --path='/var/www/html' \
                   || { echo "wp config create failed"; exit 1; }

  wp core install --allow-root \
                  --url=$DOMAIN_NAME \
                  --title=$WP_TITLE \
                  --admin_user=$WP_ADMIN \
                  --admin_password=$WP_ADMIN_PASSWORD \
                  --admin_email=$WP_ADMIN_EMAIL \
                  --skip-email \
                  --path='/var/www/html' \
                  || { echo "wp core install failed"; exit 1; }
fi

wp theme install hestia --activate --allow-root --path="/var/www/html" \
				|| { echo "wp theme install failed"; }

wp user create	$WP_USER \
				$WP_USER_EMAIL \
				--role=author \
				--user_pass=$WP_USER_PASSWORD \
				--path='/var/www/html' \
				--allow-root \


/usr/sbin/php-fpm7.4 -F
