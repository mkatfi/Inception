
all: build up

build:
	docker compose -f srcs/docker-compose.yml build

up: build
	mkdir -p /home/mkatfi/data/wordpress
	mkdir -p /home/mkatfi/data/mariadb
	docker compose -f srcs/docker-compose.yml up -d

down:
	docker compose -f srcs/docker-compose.yml down

clean:
	sudo rm -rf /home/mkatfi/data/wordpress/*
	sudo rm -rf /home/mkatfi/data/mariadb/*
	sudo rm -rf /home/mkatfi/data
	docker container rm -f mariadb wordpress nginx
	docker volume rm `docker volume ls -q`

stop:
	docker stop `docker ps -q`

start:
	docker start `docker ps -aq`

fclean: clean
	sudo docker system prune -af

re: clean down up