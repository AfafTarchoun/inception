FROM debian:buster
RUN apt-get update && apt-get install -y php7.3-fpm \
php7.3-fpm php-mysql mariadb-client \
nginx wget curl
#wordpress
RUN wget -c https://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz -C /var/www/html/
# Downloading WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# Making the wp-cli.phar file executable and moving it to the /usr/local/bin/ path
# and renaming it 'wp' to use that as the command and not 'wp-cli.phar'
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY ./tools/script.sh /
COPY ./tools/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./tools/wp-config.php /var/www/html/wordpress
RUN chmod +x /script.sh
RUN mkdir /run/php/

CMD ["/script.sh", "php-fpm7.3", "-R", "-F"]
