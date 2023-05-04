chown -R www-data:www-data /var/www/html/wordpress

mkdir -p /run/php
touch /run/php/php7.3-fpm.sock
chown -R www-data:www-data /run/php
chmod 666 /run/php/php7.3-fpm.sock

cd /var/ww/html/wordpress
#Downloading and extracting Wordpress core files to the current directory
wp core download --allow-root

#Creatig the wp-config.php file using this command.
wp core config --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb --allow-root

#Installing wordpress using the given environement variables to avoid showing the wordpress installation page everytime we run the container
wp core install --url=${DOAMIN_NAME} --title=atarchouInception --admin_user=${WP_USER} --admin_password=${WP_PW} --admin_email=${WP_EMAIL} --allow-root

wp search-replace 'localhost' 'atarchou@42.fr' --allow-root

wp search-replace 'https://localhost' 'https://atarchou@42.fr' --allow-root

sed -i 's/listen =\/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php7.3/fpm/pool.d/www.conf

exec $@
