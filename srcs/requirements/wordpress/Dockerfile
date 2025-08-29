FROM debian:bookworm

RUN apt-get -y update && apt-get install -y \
    wget \
    curl \
    bash \
    php8.2 \
    php8.2-fpm \
    php8.2-mysql \
    php8.2-pdo \
    php8.2-gd \
    php8.2-cli \
    php8.2-mbstring \
    redis \
    php8.2-redis \
    php-mysqli \
    default-mysql-client \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp
    
RUN mkdir -p /var/www/html \
    && mkdir -p /var/www/html/wp-content \
    && mkdir -p /var/www/html/wp-content/uploads \
    && mkdir -p /var/www/html/wp-content/cache \
    && mkdir -p /var/www/html/wp-content/plugins \
    && mkdir -p /var/www/html/wp-content/themes \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && chmod -R 775 /var/www/html/wp-content

# Set proper permissions for Redis
RUN mkdir -p /var/lib/redis \
    && chown redis:redis /var/lib/redis \
    && chmod 755 /var/lib/redis

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/.
COPY Tools/init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh

CMD ["/usr/local/bin/init.sh"]
