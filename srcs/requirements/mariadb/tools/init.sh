#!/bin/bash

# # Start MySQL
# echo "MySQL has started!"
# service mysql start
# sleep 30
# echo "after sleep"
# # Create Database
# mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# # Create User
# mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

# # Grant Privileges
# mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# # Flush privileges
# mysql -e "FLUSH PRIVILEGES;"

# # Modify root user
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# mysqld_safe

# echo "Waiting for MySQL to start..."
# echo "MySQL has started!"

if [ -d "/var/lib/mysql/$SQL_DATABASE" ]; then 
	echo "Database already exists"
else
	service mysql start
	sleep 30
	echo "after sleep"
	# Create Database
	mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

	# Create User
	mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

	# Grant Privileges
	mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

	# Flush privileges
	mysql -e "FLUSH PRIVILEGES;"

	# Modify root user
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

	mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
fi

# Start the MySQL service using mysqld_safe
mysqld_safe

# CREATE DATABASE IF NOT EXISTS wordpress;
# CREATE USER IF NOT EXISTS 'bozo'@'%' IDENTIFIED BY '12345';
# GRANT ALL PRIVILEGES ON wordpress.* TO 'bozo'@'%';
# FLUSH PRIVILEGES;
# ALTER USER 'root'@'localhost' IDENTIFIED BY 'root12345';