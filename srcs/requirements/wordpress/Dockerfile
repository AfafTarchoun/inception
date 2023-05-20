FROM debian:buster

RUN mkdir -p /var/www/html/wordpress

RUN apt-get update && apt-get install -y php7.3-fpm \
php7.3-fpm php-mysql -y mariadb-client \
nginx wget curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN wget -c https://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz -C /var/www/html/

EXPOSE 9000

COPY /tools/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY /tools/script.sh /var/www/html/wordpress

RUN chmod +x /var/www/html/wordpress/script.sh

CMD ["sh" , "/var/www/html/wordpress/script.sh"]
