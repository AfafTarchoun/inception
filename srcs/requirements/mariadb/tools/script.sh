#!/bin/bash
service mysql start
	echo "CREATE DATABASE $MYSQL_DATABASE ;" > db1.sql
	echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> db1.sql
	echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' ;" >> db1.sql
mysql < db1.sql
service mysql stop
mysqld
