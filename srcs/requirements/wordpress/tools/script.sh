#!/bin/bash
chown -R www-data:www-data /var/www/html/wordpress

mkdir -p /run/php
touch /run/php/php7.3-fpm.sock
chown -R www-data:www-data /run/php
chmod 660 /run/php/php7.3-fpm.sock

mkdir /var/www
mkdir /var/www/html

cd /var/www/html/wordpress

wp core download --allow-root

wp core config --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb --allow-root

wp core install --url=${DOMAIN_NAME} --title=atarchouInception --admin_user=${WP_USER} --admin_password=${WP_PW} --admin_email=${WP_EMAIL} --allow-root

wp user create ${WP_USER} random@gmail.com --user_pass=${WP_PW} --role=author --allow-root

#wp search-replace 'localhost' 'atarchou.42.fr' --allow-root

#wp search-replace 'https://localhost' 'https://atarchou.42.fr' --allow-root


exec $@
