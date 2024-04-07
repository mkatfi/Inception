#!/bin/bash

sed -i -e 's/.*listen = .*/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf

sleep 5

cd /var/www/wordpress

wp config create --allow-root \
				--dbname=$MYSQL_DATABASE \
				--dbuser=$MYSQL_USER \
				--dbpass=$MYSQL_PASSWORD \
				--dbhost=$DB_host

wp core install --url=$DOMUNE_NAME \
				--title=$TITER \
				--admin_user=$ADMIN_USER \
				--admin_password=$ADMIN_PASSWORD \
				--admin_email=$EMAIL --allow-root
wp user create $USER_WNAME $EMAIL_USER_WNAME --role=$ROLE --user_pass=$USER_PASS --allow-root

chmod -R 777 wp-content

/usr/sbin/php-fpm7.4 -F