# Adminer Dockerfile
FROM debian:bookworm-slim

# Install Apache, PHP, and required modules
RUN apt-get update && apt-get install -y \
    adminer \
    curl \
    && rm -rf /var/lib/apt/lists/*



# Set permissions so Apache can write if needed
RUN chown -R www-data:www-data /var/www/html

# Expose HTTP port
EXPOSE 8080

# Run Adminer
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/usr/share/adminer"]
