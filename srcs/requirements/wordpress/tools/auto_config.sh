#!/bin/bash

# Sleep for 10 seconds to ensure MariaDB is up and running
sleep 10

# Check if wp-config.php exists
if [ ! -f /var/www/wordpress/wp-config.php ]; then
    # Use WP-CLI to create WordPress configuration
    wp config create \
        --allow-root \
        --dbname=$SQL_DATABASE \
        --dbuser=$SQL_USER \
        --dbpass=$SQL_PASSWORD \
        --dbhost=mariadb:3306 \
        --path='/var/www/wordpress'
		
	# Run WordPress installation
    wp core install \
        --allow-root \
        --url=http://localhost \
        --title="Your Site Title" \
        --admin_user=cperron \
        --admin_password=Cperron123 \
        --admin_email=cperron@hotmail.com

    # Create additional WordPress user
    wp user create \
        --allow-root \
        user2 \
        user2@example.com \
        --role=author
fi