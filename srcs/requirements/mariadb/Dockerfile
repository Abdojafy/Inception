FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt install -y mariadb-server

COPY ./tools/script.sh /tmp/script.sh

RUN chmod +x /tmp/script.sh

RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT  ["bash", "/tmp/script.sh"]
