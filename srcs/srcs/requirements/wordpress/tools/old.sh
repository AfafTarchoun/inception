#!/bin/bash

cd /var/www/html/wordpress

rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

sed -i -r "s/database/$db_name/1"   wp-config.php

sed -i -r "s/database_user/$db_user/1"  wp-config.php

sed -i -r "s/passwod/$db_pwd/1"    wp-config.php

sed -i -r "s/localhost/mariadb/1"    wp-config.php  (to connect with mariadb database)

wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

#sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir -p /run/php

touch /run/php/php7.3-fpm.sock

chown -R www-data:www-data /run/php
chmod 660 /run/php/php7.3-fpm.sock

/usr/sbin/php-fpm7.3 -F
