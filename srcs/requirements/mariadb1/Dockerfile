# Fetch the OS we want
FROM debian:buster

# Install MariaDB + updates
RUN apt update -y && apt install -y mariadb-server

# Copy over config files
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/

# Copy over bash script
COPY conf/mariadb.sh /usr/local/bin/

# Chmod the script
RUN chmod +x /usr/local/bin/mariadb.sh

# Set the container entry point to the script
CMD ["/usr/local/bin/mariadb.sh"]

# # Expose the MySQL port
# EXPOSE 3306

# #Fetch the os we want
# FROM debian:buster

# # install mariadb + updates
# RUN apt update -y && apt install -y mariadb-server

# # copy over config files
# COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/

# # copy over bash script
# COPY conf/mariadb.sh /usr/local/bin/

# #chmod deez
# RUN chmod +x /usr/local/bin/mariadb.sh
# RUN /usr/local/bin/mariadb.sh

# EXPOSE 3306

# # ENTRYPOINT ["/usr/local/bin/mariadb.sh"]

# CMD ["mysqld_safe"]