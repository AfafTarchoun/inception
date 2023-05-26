FROM debian:buster

RUN mkdir -p /var/www/html/wordpress

RUN apt-get update -y 

RUN apt-get upgrade -y

RUN apt-get install -y php-fpm php7.3-fpm php-mysql \
mariadb-client curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

COPY /tools/script.sh /var/www/html/wordpress

COPY /tools/www.conf /etc/php/7.3/fpm/pool.d/www.conf

CMD ["sh" , "/var/www/html/wordpress/script.sh"]
