
# Start MySQL
service mysql start

# Create Database
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# Create User
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

# Grant Privileges
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# Modify root user
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# Flush privileges
mysql -e "FLUSH PRIVILEGES;"

# Shutdown MySQL
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# Start MySQL safely
exec mysqld_safe
