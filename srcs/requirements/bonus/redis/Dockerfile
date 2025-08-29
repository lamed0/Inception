FROM debian:latest

# Install Redis
RUN apt-get update && apt-get install -y redis-server && rm -rf /var/lib/apt/lists/*

# Allow Redis to accept connections inside Docker network
RUN sed -i 's/^bind 127.0.0.1/# bind 127.0.0.1/' /etc/redis/redis.conf && \
    sed -i 's/^protected-mode yes/protected-mode no/' /etc/redis/redis.conf

# Create data directory with proper permissions
RUN mkdir -p /data \
    && chown -R redis:redis /data \
    && chmod 775 /data

# Set volume (Docker will manage permissions automatically inside container)
VOLUME /data
USER redis
# Start Redis as default command
CMD ["redis-server", "--protected-mode", "no", "--dir", "/data"]

