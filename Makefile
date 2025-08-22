# **************************************************************************** #
#                                   Makefile                                   #
# **************************************************************************** #

NAME = inception
DOCKER_COMPOSE = docker compose -f ./srcs/docker-compose.yml

# Persistent volumes path (adjust if different in docker-compose.yml)
VOLUME_DIR = /home/$(USER)/data
MARIADB_VOLUME = ./data/mariadb
WORDPRESS_VOLUME = ./data/wordpress

# Default target
all: up

# Build and start containers
up: $(MARIADB_VOLUME) $(WORDPRESS_VOLUME)
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

# Ensure volumes exist
$(MARIADB_VOLUME):
	@mkdir -p $@

$(WORDPRESS_VOLUME):
	@mkdir -p $@

.PHONY: all up down fclean re ps logs
