#!/bin/bash

# Start the MariaDB service
service mysql start

# Create the database if it doesn't exist
mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"

# Create the user if it doesn't exist
mysql -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"

# Grant all privileges to the user on the database
mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"

# Change the root user's password
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"

# Flush privileges to ensure changes take effect
mysql -p${DB_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

# Shut down the mysql service
mysqladmin -u root -p${DB_ROOT_PASSWORD} shutdown

# Restart MariaDB in safe mode
exec mysqld-safe

