sed -i -e 's/.*listen = .*/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf

wp core download --allow-root

cd /var/www/wordpress

wp config create --allow-root \
                 --dbname=$MYSQL_DATABASE \
				 --dbuser=$MYSQL_USER \
				 --dbpass=$MYSQL_PASSWORD \
				 --dbhost=mariadb:3306 --path='/var/www/wordpress'

wp core install --url=mkatfi.42.fr --title=baradosa --admin_user=barados --admin_password=123 --admin_email=info@gmail.com --allow-root
wp user create bradisa bradisa@gamail.com --role=editor --user_pass=123 --allow-root

/usr/sbin/php-fpm7.4 -F