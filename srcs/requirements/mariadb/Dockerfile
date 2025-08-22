FROM debian:latest

RUN apt-get update && apt-get install -y mariadb-server \
    && rm -rf /var/lib/apt/lists/*

# Ensure socket directory exists
RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

# Copy SQL init and startup script
COPY conf/50-server.cnf /etc/mysql/my.cnf
COPY Tools/init.sql /etc/mysql/init.sql
COPY Tools/start_mariadb.sh /start_mariadb.sh
RUN chmod +x /start_mariadb.sh

CMD ["/start_mariadb.sh"]
