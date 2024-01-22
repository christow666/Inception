FROM debian:buster

RUN apt update -y \
    && apt upgrade -y \
	&& apt-get -y install wget
	# && apt-get -y install vim

RUN apt-get install -y php7.3\
	php-fpm\
	php-mysql\
	mariadb-client

# RUN	chown -R root:root /var/www/wordpress
#user = www-data

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

# Install WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp-cli

WORKDIR /var/www/html


# Copy the auto_config.sh script
COPY tools/auto_config.sh /usr/local/bin/


# Make the script executable
RUN chmod +x /usr/local/bin/auto_config.sh
ENTRYPOINT ["/usr/local/bin/auto_config.sh"]

# # Create /run/php directory
# RUN mkdir -p /run/php

# # Start PHP-FPM
# RUN echo "starting php"
# CMD ["/usr/sbin/php-fpm7.3", "-F"]

# CMD ["sh", "-c", "php-fpm7.3 -F"]
