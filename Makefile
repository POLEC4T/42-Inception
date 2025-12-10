
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

clean: down

fclean: clean downv

re: fclean all

logs:
	$(COMPOSE) logs -f

.PHONY: all clean fclean re up down downv build logs