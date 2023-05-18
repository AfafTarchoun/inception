#!/bin/bash

chown -R www-data:www-data /var/www/html/wordpress/wp-config.php
chmod -R 755 /var/www/html/wordpress

mkdir -p /run/php
touch /run/php/php7.3-fpm.sock
chown -R www-data:www-data /run/php
chmod 660 /run/php/php7.3-fpm.sock

cd /var/www/html/wordpress

wp core download --allow-root


wp core config --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb --allow-root > /var/www/html/wordpress/wp-config.php

wp core install --url=${DOMAIN_NAME} --title=Inception --admin_user=${WP_AD} --admin_password=${WP_PW} --admin_email=${WP_EMAIL} --allow-root

wp user create ${WP_USER} --user_email=${WP_USER_EMAIL} --user_pass=${WP_USR_PW} --role=author --allow-root

sed -i "/DB_NAME/s#.*#define( 'DB_NAME', '$MYSQL_DATABASE' );#g" /var/www/html/wordpress/wp-config.php

sed -i "/DB_USER/s#.*#define( 'DB_USER', '$MYSQL_USER' );#g" /var/www/html/wordpress/wp-config.php

sed -i "/DB_PASSWORD/s#.*#define( 'DB_PASSWORD', '$MYSQL_PASSWORD' );#g" /var/www/html/wordpress/wp-config.php

sed -i "/DB_HOST/s#.*#define( 'DB_HOST', 'mariadb' );#g" /var/www/html/wordpress/wp-config.php
