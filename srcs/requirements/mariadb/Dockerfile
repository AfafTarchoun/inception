FROM debian:buster
RUN apt-get update && apt-get install -y mariadb-server
RUN apt-get install -y mariadb-server
COPY ./tools/script.sh /
COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod +x script.sh
CMD ["/script.sh","mysqld", "--skip_networking=false"]
