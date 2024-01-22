FROM debian:buster
# RUN apt update \
# 	&& apt install nginx -y \
# 	# && apt install vim -y \
# 	&& apt install curl -y \
# 	&& mkdir -p /etc/nginx/ssl \
# 	&& apt install openssl -y \
# 	&& openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=CA/ST=QC/L=Quebec/O=42/OU=42/CN=cperron.42.ca/UID=cperron"

RUN apt update -y && apt install -y nginx && apt install openssl -y

# TLS/SSL
RUN	mkdir -p /etc/nginx/ssl && openssl req -x509 -nodes \
		-out /etc/nginx/ssl/inception.crt \
		-keyout /etc/nginx/ssl/inception.key \
		-subj "/C=CA/ST=QC/L=QC/O=42school/OU=42Network/CN=cperron/UID=cperron"




RUN chmod 755 /var/www/html \
	&& chown -R www-data:www-data /var/www/html

COPY conf/default.conf /etc/nginx/conf.d/default.conf
# # Default SSL/TLS PORT
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]