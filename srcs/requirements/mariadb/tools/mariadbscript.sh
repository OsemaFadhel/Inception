#!/bin/bash

# Start the MariaDB service
systemctl start mariadb
systemctl enable mariadb


sleep 10

# Create the database if it doesn't exist
echo "Creating database if it doesn't exist..."
mysql -u root -p"${DB_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"

# Create the user if it doesn't exist
echo "Creating user if it doesn't exist..."
mysql -u root -p"${DB_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"

# Grant all privileges to the user on the database
echo "Granting privileges..."
mysql -u root -p"${DB_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}' WITH GRANT OPTION;"

# Change the root user's password
echo "Changing root user's password..."
mysql -u root -p"${DB_ROOT_PASSWORD}" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"

# Flush privileges to ensure changes take effect
echo "Flushing privileges..."
mysql -u root -p"${DB_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

# Shut down the mysql service
echo "Shutting down MariaDB service..."
mysqladmin -u root -p"${DB_ROOT_PASSWORD}" shutdown

# Wait for shutdown to complete
sleep 10

# Restart MariaDB in safe mode
exec mysqld-safe

