#!/bin/bash

# Start MariaDB service
service mysqld start

# Create the database if it doesn't exist
mysqld -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"

# Create the user if it doesn't exist
mysqld -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"

# Grant privileges to the user
mysqld -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"

# Update the root user password
mysqld -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"

# Flush privileges
mysqld -e "FLUSH PRIVILEGES;"

# Shutdown the MariaDB server
mysqladmin -u root -p"${DB_ROOT_PASSWORD}" shutdown

# Start MariaDB safely
exec mysqld_safe

