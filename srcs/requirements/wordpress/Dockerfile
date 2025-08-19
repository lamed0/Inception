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
    && rm -rf /var/lib/apt/lists/*


COPY conf/www.conf /etc/php/8.2/fpm/pool.d/.
COPY Tools/init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh

CMD ["/usr/local/bin/init.sh"]
