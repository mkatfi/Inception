FROM debian:11

RUN apt update -y && apt-get install mariadb-server -y

COPY conf/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/script.sh /var/script.sh 

RUN chmod 0777 /var/script.sh

EXPOSE 3306

CMD ["/var/script.sh"]