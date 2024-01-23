#!/bin/bash

#!/bin/bash

if [ -f /var/www/wordpress/wp-config.php ]; then
    echo "Removing existing wp-config.php..."
    rm /var/www/wordpress/wp-config.php
fi

# Sleep for 10 seconds to ensure MariaDB is up and running
echo "Waiting for MariaDB to start..."
sleep 10

# Check if wp-config.php exists
if [ ! -f /var/www/wordpress/wp-config.php ]; then
    echo "Creating WordPress configuration using WP-CLI..."
    
    cd /var/www/wordpress
    
    # Use WP-CLI to create WordPress configuration
    /usr/local/bin/wp-cli config create \
        --allow-root \
        --dbname=$SQL_DATABASE \
        --dbuser=$SQL_USER \
        --dbpass=$SQL_PASSWORD \
        --dbhost=mariadb:3306 \
        --path='.'

    # Run WordPress installation
    echo "Installing WordPress..."
    /usr/local/bin/wp-cli core install \
        --allow-root \
        --url=http://localhost \
        --title=$WORDPRESS_DOMAIN_NAME \
        --admin_user=$WORDPRESS_ROOT_LOGIN \
        --admin_password=$WORDPRESS_ROOT_PASS \
        --admin_email=$WORDPRESS_ROOT_EMAIL

    # Create additional WordPress user
    echo "Creating additional WordPress user..."
    /usr/local/bin/wp-cli user create \
        --allow-root \
		$WORDPRESS_USER_NAME \
		$WORDPRESS_USER_EMAIL \
        --role=author

    echo "WordPress setup completed successfully!"
else
    echo "wp-config.php already exists. Skipping WordPress setup."
fi

mkdir -p /run/php

echo "starting php"
exec /usr/sbin/php-fpm7.3 -F