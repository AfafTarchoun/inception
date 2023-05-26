FROM debian:buster

ARG MYSQL_DATABASE MYSQL_ROOT_PASSWORD MYSQL_USER MYSQL_PASSWORD

RUN apt-get update -y

RUN apt-get upgrade -y

RUN apt-get install -y mariadb-server

RUN mkdir -p /var/run/mysql

RUN chown -R mysql:mysql /var/run/mysql

COPY ./tools/script.sh ./script.sh

COPY ./tools/50-server.cnf ./etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /script.sh

RUN sh ./script.sh

EXPOSE 3306

CMD ["mysqld", "--skip_networking=false"]
