#!/bin/bash
# start_mariadb.sh

MYSQL_DATA_DIR="/var/lib/mysql"

# Initialize database if empty
if [ ! -d "$MYSQL_DATA_DIR/mysql" ]; then
    echo "Initializing MariaDB..."
    mysqld --initialize-insecure --user=mysql --datadir="$MYSQL_DATA_DIR"
    
    # Start MariaDB in the background
    mysqld --skip-networking --user=mysql --datadir="$MYSQL_DATA_DIR" &
    pid="$!"
    sleep 5

    # Execute init SQL
    mysql < /docker-entrypoint-initdb.d/init.sql

    # Stop background server
    kill $pid
fi

# Start MariaDB normally
exec mysqld --user=mysql --datadir="$MYSQL_DATA_DIR"


