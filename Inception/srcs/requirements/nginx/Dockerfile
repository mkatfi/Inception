FROM debian:11

RUN apt-get update -y && apt-get install nginx -y

RUN apt-get install -y openssl 

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes \
    -keyout /etc/nginx/ssl/private-key.key \
    -out /etc/nginx/ssl/mkatfi.42.fr.crt \
    -subj "/C=MR/ST=1337/L=BenGuerir/O=42/OU=42/CN=mkatfi.42.fr/UID=mkatfi"

COPY ./conf/nginx.conf etc/nginx/sites-enabled/

RUN mkdir -p /var/run/nginx

RUN chmod 0777 /var/www/html && chown -R www-data:www-data /var/www/html

# COPY ./index.html /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]
