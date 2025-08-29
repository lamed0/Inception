#!/bin/bash

# Fix permissions for mounted volume
chown -R mysql:mysql /var/lib/mysql
chown -R mysql:mysql /run/mysqld

# Initialize database if it doesn't exist
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing database..."
    mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
fi

# Start MariaDB in the background as mysql user
echo "Starting MariaDB..."
mariadbd --user=mysql --datadir=/var/lib/mysql &

# Wait for MariaDB to be ready
echo "Waiting for MariaDB to start..."
while ! mariadb -e "SELECT 1" &>/dev/null 2>&1; do
    sleep 1
done

echo "MariaDB is ready!"

# Run initialization SQL if it exists
if [ -f "/etc/mysql/init.sql" ]; then
    echo "Running initialization SQL..."
    mariadb < /etc/mysql/init.sql
fi

# Keep the container running
wait