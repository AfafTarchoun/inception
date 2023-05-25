FROM debian:buster

RUN apt-get update

RUN apt-get install -y nginx && apt-get install -y openssl

COPY ./tools/certificate.crt /etc/ssl/

COPY ./tools/private.key /etc/ssl/

COPY ./tools/default.conf /etc/nginx/sites-available/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
