FROM debian:latest
RUN apt-get update && apt-get install -y mariadb-server \
 && rm -rf /var/lib/apt/lists/*

# Ensure socket directory exists
RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

# Ensure data directory has correct permissions
RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql

# Copy configuration files
COPY conf/50-server.cnf /etc/mysql/my.cnf
COPY Tools/init.sql /etc/mysql/init.sql
COPY Tools/start_mariadb.sh /start_mariadb.sh
RUN chmod +x /start_mariadb.sh


CMD ["/start_mariadb.sh"]
