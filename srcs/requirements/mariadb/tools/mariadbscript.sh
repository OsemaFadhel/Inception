#!/bin/sh

service mysql start

mysql -e "CREATE DATABASE \`${db_name}\`;"

mysql -e "CREATE USER \`${db_user}\`@'localhost' IDENTIFIED BY \`${db_password}\`;"

mysql -e "GRANT ALL PRIVILEGES ON \`${db_name}\`.* TO \`${db_user}\`@'%' IDENTIFIED BY '${db_password}';"

mysql -e "ALTER USER \`${db_user}\`@'localhost' IDENTIFIED WITH '${db_password}';"

mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p shutdown

exec mysqld_safe
