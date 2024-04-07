FROM debian:11

RUN apt-get update -y && apt-get install nginx -y

RUN apt-get install -y openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes \
    -keyout /etc/nginx/ssl/private-key.key \
    -out /etc/nginx/ssl/mkatfi.42.fr.crt \
    -subj "/"

COPY ./conf/nginx.conf etc/nginx/sites-enabled/

RUN mkdir -p /var/run/nginx

#www-data is a user of fpm  for secutrity reseon 
RUN chmod 0777 /var/www/html && chown -R www-data:www-data /var/www/html

RUN rm -rf /etc/nginx/sites-enabled/default

CMD [ "nginx", "-g", "daemon off;" ]