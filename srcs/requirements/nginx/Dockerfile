FROM debian:buster
RUN apt update \
	&& apt install nginx -y \
	# && apt install vim -y \
	&& apt install curl -y \
	&& mkdir -p /etc/nginx/ssl \
	&& apt install openssl -y \
	&& openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=CA/ST=QC/L=Quebec/O=42/OU=42/CN=cperron.42.ca/UID=cperron"
COPY conf/default.conf /etc/nginx/conf.d/default.conf
RUN chmod 755 /var/www/html \
	&& chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]