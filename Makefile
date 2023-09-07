VOLUME_WORDPRESS = srcs_wordpress_v
VOLUME_MARIADB = srcs_mariadb_v

up : build
	@docker compose -f ./srcs/docker-compose.yml up -d

build:
	sudo mkdir -p /home/ajafy/data/wp
	sudo mkdir -p /home/ajafy/data/db
	docker compose -f ./srcs/docker-compose.yml build

down:
	@docker compose -f ./srcs/docker-compose.yml down

prune: down
	@docker system prune -af || true
	docker volume rm $(VOLUME_MARIADB) || true
	docker volume rm $(VOLUME_WORDPRESS) || true
	sudo rm -rf /home/ajafy/data/wp || true
	sudo rm -rf /home/ajafy/data/db || true

re: prune up

.PHONY: up build down prune re
