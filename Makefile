
COMPOSE_FILE = srcs/docker-compose.yml
PROJECT_NAME = inception
COMPOSE = docker compose -f $(COMPOSE_FILE) --project-name $(PROJECT_NAME)

all: up

up:
	$(COMPOSE) up -d

build:
	$(COMPOSE) build --no-cache

down:
	$(COMPOSE) down

downv:
	$(COMPOSE) down -v

rmvolumes:
	rm -rf /home/mniemaz/data/wordpress/*
	rm -rf /home/mniemaz/data/mariadb/*

clean: down

fclean: downv rmvolumes

re: fclean build up

logs:
	$(COMPOSE) logs -f

ps:
	$(COMPOSE) ps

.PHONY: all clean fclean re up down downv build logs ps