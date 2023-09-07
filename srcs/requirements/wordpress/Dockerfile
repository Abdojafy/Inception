FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get -y install wget

RUN apt-get install -y php7.4 php-fpm php-mysql mariadb-client

COPY ./tools/script.sh /

RUN chmod +x /script.sh

RUN echo 'clear_env = no' << /etc/php/7.4/fpm/pool.d/www.conf

RUN sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|g' /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /var/www/html

CMD ["bash", "script.sh"]
