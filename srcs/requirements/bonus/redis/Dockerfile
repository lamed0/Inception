FROM debian:latest

# Install Redis
RUN apt-get update && apt-get install -y redis-server && rm -rf /var/lib/apt/lists/*

# Configure Redis
RUN sed -i 's/^bind 127.0.0.1/# bind 127.0.0.1/' /etc/redis/redis.conf && \
    sed -i 's/^protected-mode yes/protected-mode no/' /etc/redis/redis.conf

# Ensure redis user has UID 999 (standard for Docker)
RUN usermod -u 999 redis && groupmod -g 999 redis

# Create data directory with proper permissions
RUN mkdir -p /data && \
    chown -R redis:redis /data && \
    chmod -R 755 /data

# Set volume
VOLUME /data

# Switch to redis user
USER redis

# Start Redis
CMD ["redis-server", "--protected-mode", "no", "--dir", "/data", "--save", "300", "1"]