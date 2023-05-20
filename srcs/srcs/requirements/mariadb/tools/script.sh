#!/bin/bash
service mysql start
mysql -u root -e "CREATE DATABASE $MYSQL_DATABASE ;"
mysql -u root -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ; GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' ; FLUSH PRIVILEGES ;"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'new_pass'; FLUSH PRIVILEGES;"
