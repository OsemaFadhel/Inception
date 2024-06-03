#!/bin/bash

# Start the MariaDB service
systemctl start mariadb
systemctl enable mariadb

# Create the database if it doesn't exist
mysql -u -p{DB_ROOT_PASSWORD} "CREATE DATABASE \`${DB_NAME}\`;"

# Create the user if it doesn't exist
mysql -u -p{DB_ROOT_PASSWORD} "CREATE USER \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"

# Grant all privileges to the user on the database
mysql -u -p{DB_ROOT_PASSWORD} "GRANT ALL ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}' WITH GRANT OPTION;"

# Change the root user's password
mysql -u -p{DB_ROOT_PASSWORD} "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"

# Flush privileges to ensure changes take effect
mysql -u -p${DB_ROOT_PASSWORD} "FLUSH PRIVILEGES;"

# Shut down the mysql service
mysqladmin -u root -p${DB_ROOT_PASSWORD} shutdown

# Restart MariaDB in safe mode
exec mysqld-safe

