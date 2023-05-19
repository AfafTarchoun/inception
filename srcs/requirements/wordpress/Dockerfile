FROM debian:buster

RUN apt-get update && apt-get install -y php7.3-fpm \
php7.3-fpm php-mysql -y mariadb-client \
nginx wget curl

RUN wget -c https://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz -C /var/www/html/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/script.sh ./script.sh

COPY ./tools/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN chmod +x /script.sh

RUN mkdir -p /run/php/

CMD ["/script.sh", "php-fpm7.3", "-R", "-F"]
