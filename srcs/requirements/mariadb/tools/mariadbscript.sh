#!/bin/sh

service mysql start

mysql -e "CREATE DATABASE \`${DB_NAME}\`;"

mysql -e "CREATE USER \`${DB_USER}\`@'localhost' IDENTIFIED BY \`${DB_PASSWORD}\`;"

mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH '${DB_ROOT_PASSWORD}';"

mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p $DB_ROOT_PASSWORD shutdown

exec mysqld_safe
