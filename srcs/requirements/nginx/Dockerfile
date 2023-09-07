FROM debian:bullseye

RUN apt update && apt install nginx -y

RUN apt install vim -y

RUN apt install curl -y

RUN mkdir -p /etc/nginx/ssl

RUN apt install openssl -y

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/CN=ajafy/O=ajafy.1337.ma/C=MA/L=KHOURIBGA"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf

CMD [ "nginx", "-g", "daemon off;"]
