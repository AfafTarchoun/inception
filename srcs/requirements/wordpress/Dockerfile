FROM debian:buster

RUN mkdir -p /var/www/html/wordpress

RUN chown -R www-data:www-data /var/www/html/wordpress

RUN apt-get update && apt-get install -y php7.3-fpm php-mysql \
mariadb-client nginx wget curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

COPY /tools/www.conf /etc/php/7/fpm/pool.d/www.conf

COPY /tools/wp-sample-config.php /var/www/html/wordpress/wp-config.php

COPY /tools/script.sh /var/www/html/wordpress

CMD ["sh" , "/var/www/html/wordpress/script.sh"]
