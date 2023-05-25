FROM debian:buster

RUN apt-get update -y

RUN apt-get upgrade -y

RUN apt-get install -y nginx openssl

COPY ./tools/certificate.crt /etc/ssl/

COPY ./tools/private.key /etc/ssl/

COPY ./tools/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
