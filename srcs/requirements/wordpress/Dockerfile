# FROM debian:buster

# RUN apt update -y \
#     && apt upgrade -y \
# 	&& apt-get -y install wget \
# 	&& apt-get -y install vim

# RUN apt-get install -y php7.3\
# 	php-fpm\
# 	php-mysql\
# 	mariadb-client

# RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

# RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

# RUN	chown -R root:root /var/www/wordpress

# COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

# # Install WP-CLI
# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
#     && chmod +x wp-cli.phar \
#     && mv wp-cli.phar /usr/local/bin/wp

# # Copy the auto_config.sh script
# # COPY tools/auto_config.sh /usr/local/bin/auto_config.sh
# COPY ./conf/wp-config.php /var/www/wordpress

# # Make the script executable
# # RUN chmod +x /usr/local/bin/auto_config.sh

# # Create /run/php directory
# RUN mkdir -p /run/php

# # Start PHP-FPM and run the auto_config.sh script
# # CMD ["sh", "-c", "php-fpm7.3 -F & /usr/local/bin/auto_config.sh"]
# CMD ["sh", "-c", "php-fpm7.3 - F"]

# ---------------
FROM debian:buster

RUN apt update -y 

RUN apt install php-fpm php-mysql -y

RUN apt install curl -y


COPY ./tools/script.sh /
WORKDIR /var/www/html

# COPY ./conf/wp-config.php /var/www/html

RUN chmod +x /script.sh

CMD [ "/script.sh" ]