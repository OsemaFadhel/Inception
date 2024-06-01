#!/bin/bash

# Start MariaDB service
service mariadb start

# Create the database if it doesn't exist
mysql -u root -p"${DB_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"

# Create the user if it doesn't exist
mysql -u root -p"${DB_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"

# Grant privileges to the user
mysql -u root -p"${DB_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'localhost';"

# Update the root user password
mysql -u root -p"${DB_ROOT_PASSWORD}" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"

# Flush privileges
mysql -u root -p"${DB_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

# Shutdown the MariaDB server
mysqladmin -u root -p"${DB_ROOT_PASSWORD}" shutdown

# Start MariaDB safely
exec mysqld_safe

