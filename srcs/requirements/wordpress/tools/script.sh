#!/bin/bash
cd /var/www/html/wordpress

wp core download --allow-root
#touch /run/php/php7.3-fpm.sock

#chown -R www-data:www-data /run/php

#chmod 660 /run/php/php7.3-fpm.sock

wp config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb --allow-root

wp core install --url=${DOMAIN_NAME} --title=Inception --admin_user=${WP_AD} --admin_password=${WP_PW} --admin_email=${WP_EMAIL} --allow-root

wp user create ${WP_USER} --user_email=${WP_USER_EMAIL} --user_pass=${WP_USR_PW} --role=author --allow-root
