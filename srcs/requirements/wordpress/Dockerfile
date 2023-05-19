FROM debian:buster

RUN apt-get update && apt-get install -y php7.3-fpm \
php7.3-fpm php-mysql -y mariadb-client \
nginx wget curl


RUN wget -c https://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz -C /var/www/html/

COPY ./tools/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY ./tools/script.sh ./script.sh

RUN chmod +x /script.sh

CMD ["sh"]
