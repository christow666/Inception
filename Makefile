DATA_DIR      =  /home/cperron/data
WORDPRESS_DIR =  $(DATA_DIR)/wordpress/
MARIADB_DIR   =  $(DATA_DIR)/mariadb/

all: build

build:
	@if [ ! -d $(DATA_DIR) ]; then \
        mkdir $(DATA_DIR); \
		chown -R cperron:cperron $(DATA_DIR); \
        echo "Directory $(DATA_DIR) created."; \
    fi
	@if [ ! -d $(WORDPRESS_DIR) ]; then \
        mkdir $(WORDPRESS_DIR); \
		chown -R cperron:cperron $(WORDPRESS_DIR); \
        echo "Directory $(WORDPRESS_DIR) created."; \
    fi
	@if [ ! -d $(MARIADB_DIR) ]; then \
        mkdir $(MARIADB_DIR); \
		chown -R cperron:cperron $(MARIADB_DIR); \
        echo "Directory $(MARIADB_DIR) created."; \
    fi
	docker-compose -f ./srcs/docker-compose.yml up -d --build

build_nocache:
	@if [ ! -d $(DATA_DIR) ]; then \
        mkdir $(DATA_DIR); \
        echo "Directory $(DATA_DIR) created."; \
    fi
	@if [ ! -d $(WORDPRESS_DIR) ]; then \
        mkdir $(WORDPRESS_DIR); \
        echo "Directory $(WORDPRESS_DIR) created."; \
    fi
	@if [ ! -d $(MARIADB_DIR) ]; then \
        mkdir $(MARIADB_DIR); \
        echo "Directory $(MARIADB_DIR) created."; \
    fi
	docker-compose -f ./srcs/docker-compose.yml up -d --build --no-cache

up:
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down

start:
	docker-compose -f ./srcs/docker-compose.yml start

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

logs:
	docker-compose -f ./srcs/docker-compose.yml logs

rm_volumes:
	docker-compose -f ./srcs/docker-compose.yml down --volumes

rm_orphans:
	docker-compose -f ./srcs/docker-compose.yml down --remove-orphans

wordpress:
	docker exec -it wordpress /bin/bash

mariadb:
	docker exec -it mariadb /bin/bash
	
status:
	docker ps -a

# watch out, will delete all local data!!! use at yout own risk.
prune: down rm_volumes rm_orphans
	sudo rm -rf $(WORDPRESS_DIR)
	sudo rm -rf $(MARIADB_DIR)
	docker image prune -a -f
	docker system prune -f

# rmi:
# docker rmi srcs_wordpress srcs_mariadb srcs_nginx

fclean: prune
	docker compose -f ./srcs/docker-compose.yml down -v && docker compose -f ./srcs/docker-compose.yml down

clean:
	docker compose -f ./srcs/docker-compose.yml down -v && docker compose -f ./srcs/docker-compose.yml down

re: prune all

.PHONY: all build up down start stop logs status prune fclean clean wordpress mariadb build_nocache re