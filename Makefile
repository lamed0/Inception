# **************************************************************************** #
#                                   Makefile                                   #
# **************************************************************************** #

NAME = inception
DOCKER_COMPOSE = docker compose -f ./srcs/docker-compose.yml
DATA_PATH = /home/med/data

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

# Clean data volumes only
clean-volumes:
	@echo "⚠️  WARNING: This will remove ALL data (WordPress, database, Redis)!"
	@echo "Press Ctrl+C to cancel, or Enter to continue..."
	@read dummy
	@$(DOCKER_COMPOSE) down
	@sudo rm -rf $(DATA_PATH)
	@echo "All volume data removed!"

# Rebuild everything from scratch
re: fclean all

# Show running containers
ps:
	@$(DOCKER_COMPOSE) ps

# Show logs
logs:
	@$(DOCKER_COMPOSE) logs -f

.PHONY: all up down fclean clean-volumes re ps logs