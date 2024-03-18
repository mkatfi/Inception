FROM debian:11

EXPOSE 3306

RUN apt update -y

ENV MYSQL_DATABASE=mariadb
ENV db_host=mariadb
ENV MYSQL_USER=admin
ENV MYSQL_PASSWORD=1234
ENV SQL_ROOT_PASSWORD=1234

RUN apt-get install mariadb-server -y
COPY conf/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./script.sh /var/script.sh 

RUN chmod 0777 /var/script.sh

CMD ["bash", "/var/script.sh"]