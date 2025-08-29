# **************************************************************************** #
#                                   Makefile                                   #
# **************************************************************************** #

NAME = inception
DOCKER_COMPOSE = docker compose -f ./srcs/docker-compose.yml


# Default target
all: up

# Build and start containers
up:
	@$(DOCKER_COMPOSE) up -d --build

# Stop containers
down:
	@$(DOCKER_COMPOSE) down

# Full clean: stop containers, remove volumes & networks, delete local data
fclean: down
	@docker network prune -f



# Rebuild everything from scratch
re: fclean all

# Show running containers
ps:
	@$(DOCKER_COMPOSE) ps

# Show logs
logs:
	@$(DOCKER_COMPOSE) logs -f

.PHONY: all up down fclean re ps logs
