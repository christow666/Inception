#!/bin/bash
sleep 10

# echo "running wp sh"
# chown -R www-data /var/www/html
# chmod -R 775 /var/www/html

# mkdir -p /run/php/
# touch /run/php/php7.3-fpm.pid

# if [ ! -f /var/www/html/wp-config.php ]; then
# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# chmod +x wp-cli.phar
# mv wp-cli.phar /usr/local/bin/wp

# cd /var/www/html

# wp core download --allow-root

# mv /var/www/wp-config.php /var/www/html

# wp core install --allow-root --url=${DOMAIN_NAME} --title=${WORDPRESS_NAME} --admin_user=${WORDPRESS_ROOT_LOGIN} --admin_password=${MYSQL_ROOT_PASSWORD} --admin_email=${WORDPRESS_ROOT_EMAIL}
# wp user create ${SQL_USER} ${WORDPRESS_USER_EMAIL} --user_pass=${SQL_PASSWORD} --role=author --allow-root
# wp theme install inspiro --activate --allow-root
# wp plugin update --all --allow-root


# fi

#!/bin/bash

# Display a message indicating the script is running
echo "Running wp script"

# Set ownership and permissions for WordPress directory
echo "Setting ownership and permissions for WordPress directory"
chown -R www-data /var/www/html
chmod -R 775 /var/www/html

# Create PHP-FPM PID file and directory
echo "Creating PHP-FPM PID file and directory"
mkdir -p /run/php/
touch /run/php/php7.3-fpm.pid

# Download and install wp-cli if wp-config.php does not exist
if [ ! -f /var/www/html/wp-config.php ]; then
    # Download and install wp-cli
    echo "Downloading and installing wp-cli"
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    # Navigate to the WordPress directory
    cd /var/www/html

    # Download WordPress core
    echo "Downloading WordPress core"
    wp core download --allow-root

    # Move the pre-configured wp-config.php file
    if [ -f /var/www/wp-config.php ]; then
    echo "Moving wp-config.php file"
    mv /var/www/wp-config.php /var/www/html/wp-config.php
	else
    echo "Error: 'wp-config.php' not found."
    echo "Either create one manually or use \`wp config create\`."
    exit 1  # Exit the script with an error code
	fi

    # Install WordPress
    echo "Installing WordPress"
    wp core install --allow-root --url=${DOMAIN_NAME} --title=${WORDPRESS_NAME} --admin_user=${WORDPRESS_ROOT_LOGIN} --admin_password=${MYSQL_ROOT_PASSWORD} --admin_email=${WORDPRESS_ROOT_EMAIL}

    # Create additional WordPress user
    echo "Creating additional WordPress user"
    wp user create ${SQL_USER} ${WORDPRESS_USER_EMAIL} --user_pass=${SQL_PASSWORD} --role=author --allow-root

    # Install and activate WordPress theme
    echo "Installing and activating WordPress theme"
    wp theme install inspiro --activate --allow-root

    # Update all WordPress plugins
    echo "Updating all WordPress plugins"
    wp plugin update --all --allow-root

    # Check if the installation was successful
    if [ $? -eq 0 ]; then
        echo "WordPress installation completed successfully"
    else
        echo "WordPress installation failed"
        exit 1  # Exit the script with an error code
    fi
fi

# Start PHP-FPM
echo "Starting PHP-FPM"
/usr/sbin/php-fpm7.3 -F
