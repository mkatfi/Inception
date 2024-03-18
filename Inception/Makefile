mariadb :
	docker container rm -f mariadb
	docker rmi -f mariadb_img
	docker build -t mariadb_img  srcs/requirements/mariadb
	docker run -d --network inception --name mariadb mariadb_img

wordpress :
	docker container rm -f wordpress
	docker rmi -f wordpress_img
	docker build -t wordpress_img srcs/requirements/wordpress 
	docker run -d --network inception  --name wordpress  -v vol:/var/www/wordpress  wordpress_img

nginx :
	docker container rm -f nginx
	docker rmi -f nginx_img
	docker build -t nginx_img srcs/requirements/nginx 
	docker run -d --network inception  --name nginx -p443:443 -v vol:/var/www/wordpress nginx_img
clean :
		docker container rm -f mariadb wordpress nginx
	docker rmi -f mariadb_img wordpress_img nginx_img
	