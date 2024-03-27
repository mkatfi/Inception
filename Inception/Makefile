
all: build up

build:
	docker compose -f srcs/docker-compose.yml build

up:
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	docker compose -f srcs/docker-compose.yml up -d

down:
	sudo rm -rf ~/data/wordpress/*
	sudo rm -rf ~/data/mariadb/*
	sudo rm -rf ~/data
	docker container rm -f mariadb wordpress nginx
	docker rmi -f mariadb wordpress nginx

	docker compose -f srcs/docker-compose.yml down -v
	
re: down up