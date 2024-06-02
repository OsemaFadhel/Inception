#!/bin/bash

service mariadb start

sleep 5

mariadb -u root -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
mariadb -u root -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
mariadb -u root -e "FLUSH PRIVILEGES;"
mariadb-admin -u root -p${DB_ROOT_PASSWORD} shutdown

exec mariadbd-safe

