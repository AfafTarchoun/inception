#!/bin/bash

cd /var/www/html/wordpress

wp core download --path="/var/www/html/wordpress" --allow-root

wp config create --path="/var/www/html/wordpress" --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_DBHOST --dbprefix=wp

wp core install --path="/var/www/html/wordpress" --allow-root --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL

wp user create --path="/var/www/html/wordpress" --allow-root $WP_USR $WP_EMAIL --user_pass=$WP_USER_PWD

chown www-data:www-data /var/www/html/wordpress/wp-content/uploads -R

mkdir -p /run/php

php-fpm7.3 -F
