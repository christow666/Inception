FROM debian:buster
RUN apt update -y \
    && apt upgrade -y \
    && apt-get install mariadb-server -y \
	&& apt install vim -y \
	&& apt install curl -y 

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the initialization script
COPY /tools/init.sql /docker-entrypoint-initdb.d/

# Run the initialization script
RUN chmod +x /docker-entrypoint-initdb.d/init.sql