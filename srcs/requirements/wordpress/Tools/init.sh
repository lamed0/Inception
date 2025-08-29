#!/bin/bash
set -e

cd /var/www/html


# --- 2. Ensure wp-content exists with correct permissions ---
mkdir -p wp-content
chown -R www-data:www-data wp-content
chmod -R 775 wp-content

# --- 3. Extract DB host and port ---
DB_HOST=${WORDPRESS_DB_HOST%%:*}       # everything before the first colon
DB_PORT=${WORDPRESS_DB_HOST##*:}       # everything after the last colon
DB_PORT=${DB_PORT:-3306}               # default to 3306 if empty
# echo "Database host: $DB_HOST"
# echo "Database port: $DB_PORT"

# --- 4. Wait for MariaDB with real login test ---
echo "Waiting for database..."
until mysql -h"$DB_HOST" -P"$DB_PORT" -u"$WORDPRESS_DB_USER" -p"$WORDPRESS_DB_PASSWORD" -e "SELECT 1" >/dev/null 2>&1; do
    echo "Database not ready yet, retrying in 3s..."
    sleep 3
done
echo "Database connection established!"

# --- 5. Wait for Redis ---
echo "Waiting for Redis..."
until nc -z redis 6379; do
    echo "Redis not ready, retrying in 3s..."
    sleep 3
done
echo "Redis is ready!"

# --- 6. Download WordPress and create wp-config.php ---
if [ ! -f wp-config.php ] || [ ! -f wp-load.php ] || [ ! -f wp-settings.php ]; then
    echo "WordPress core files missing, downloading..."
    
    # Only download if core files are completely missing
    if [ ! -f wp-load.php ] || [ ! -f wp-settings.php ]; then
        echo "Downloading WordPress core..."
        wp core download --allow-root
    fi
    
    # Create wp-config.php if it doesn't exist
    if [ ! -f wp-config.php ]; then
        echo "Creating wp-config.php..."
        wp config create \
            --dbname="$WORDPRESS_DB_NAME" \
            --dbuser="$WORDPRESS_DB_USER" \
            --dbpass="$WORDPRESS_DB_PASSWORD" \
            --dbhost="$DB_HOST" \
            --allow-root
        chmod 664 wp-config.php
    fi
else
    echo "WordPress core files and wp-config.php exist, skipping download."
fi

# --- 7. Install WordPress if not already installed ---
if ! wp core is-installed --allow-root >/dev/null 2>&1; then
    echo "Installing WordPress..."
    wp core install \
        --url="$DOMAIN_NAME" \
        --title="inception" \
        --admin_user="$WORDPRESS_ROOT_NAME" \
        --admin_password="$WORDPRESS_ROOT_PASS" \
        --admin_email="$WORDPRESS_ROOT_EMAIL" \
        --skip-email \
        --allow-root
else
    echo "WordPress already installed, skipping installation."
fi

# --- 8. Configure Redis plugin ---
wp plugin install redis-cache --activate --allow-root

wp config set WP_CACHE true --allow-root
wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --allow-root
wp config set WP_REDIS_DATABASE 0 --allow-root
wp config set WP_REDIS_MAXTTL 3600 --allow-root
wp config set WP_REDIS_TIMEOUT 1 --allow-root
wp config set WP_REDIS_READ_TIMEOUT 1 --allow-root

wp redis enable --allow-root

# --- 9. Create additional user if not exists ---
if ! wp user get "$WORDPRESS_USER_NAME" --allow-root >/dev/null 2>&1; then
    echo "Creating additional user: $WORDPRESS_USER_NAME"
    wp user create "$WORDPRESS_USER_NAME" "$WORDPRESS_USER_EMAIL" \
        --user_pass="$WORDPRESS_USER_PASS" \
        --role=author \
        --allow-root
else
    echo "Additional WordPress user $WORDPRESS_USER_NAME already exists, skipping."
fi

# --- 10. Update all plugins ---
wp plugin update --all --allow-root
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html
chmod -R 775 /var/www/html/wp-content

# Ensure uploads directory is writable
mkdir -p /var/www/html/wp-content/uploads
chown -R www-data:www-data /var/www/html/wp-content/uploads
chmod -R 775 /var/www/html/wp-content/uploads

# Add filesystem method to wp-config if not present
if ! grep -q "FS_METHOD" /var/www/html/wp-config.php; then
    echo "define('FS_METHOD', 'direct');" >> /var/www/html/wp-config.php
fi
# --- 11. Start PHP-FPM ---
echo "Starting PHP-FPM..."
exec php-fpm8.2 -F
