FROM debian:buster
RUN apt-get update && apt-get upgrade -y && apt-get install nginx
COPY index.html /usr/share/nginx/html
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
COPY certificate.crt /etc/ssl/
COPY private.key /etc/ssl/