FROM debian:latest

RUN apt-get update && apt-get install -y redis-server && rm -rf /var/lib/apt/lists/*

# Allow Redis to accept connections (inside docker network)
RUN sed -i 's/^bind 127.0.0.1/# bind 127.0.0.1/' /etc/redis/redis.conf && \
    sed -i 's/^protected-mode yes/protected-mode no/' /etc/redis/redis.conf

CMD ["redis-server", "--protected-mode", "no"]
