#!/bin/bash

# Start MariaDB service
service mariadb start

sleep 5

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${db_name}\`;"
mariadb -e "CREATE USER IF NOT EXISTS \`${db_user}\`@'localhost' IDENTIFIED BY '${db_pwd}';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${db_name}\`.* TO \`${db_user}\`@'%' IDENTIFIED BY '${db_pwd}';"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mariadb -p1234 -e "FLUSH PRIVILEGES;"
mariadb-admin -u root -p$SQL_ROOT_PASSWORD shutdown

exec mariadbd-safe

