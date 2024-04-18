#!/bin/sh

service mysql start

mysql -e "CREATE DATABASE wordpress;"

mysql -e "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';"

mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'localhost';"

mysql -e "ALTER USER 'admin'@'localhost' IDENTIFIED WITH mysql_native_password BY 'admin';

mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p shutdown

exec mysqld_safe
