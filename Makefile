
COMPOSE_FILE = srcs/docker-compose.yml
PROJECT_NAME = inception
VOLUMES_PATH = /home/mniemaz/data
COMPOSE = docker compose -f $(COMPOSE_FILE) --project-name $(PROJECT_NAME)

all: up

up: mkvolumes_dirs
	$(COMPOSE) up -d

mkvolumes_dirs:
	mkdir -p $(VOLUMES_PATH)/mariadb $(VOLUMES_PATH)/wordpress

build:
	$(COMPOSE) build --no-cache

down:
	$(COMPOSE) down

downv:
	$(COMPOSE) down -v

clean: down

rmvolumes:
	sudo chmod 777 /$(VOLUMES_PATH)/mariadb $(VOLUMES_PATH)/wordpress
	sudo rm -rf $(VOLUMES_PATH)/mariadb/* $(VOLUMES_PATH)/wordpress/*

fclean: clean downv rmvolumes

re: fclean build up

logs:
	$(COMPOSE) logs -f

prune: rmvolumes
	docker system prune --all --volumes --force

ps:
	$(COMPOSE) ps

.PHONY: all clean fclean re up down downv build logs ps prune rmvolumes mkvolumes_dirs