# Makefile for Django app with Docker and Poetry

# Define the default target
.DEFAULT_GOAL := help

help:
	@echo "Usage: make [target]"
	@echo "Targets:"
	@echo "  build          Build Docker image"
	@echo "  run            Run Docker containers"
	@echo "  stop           Stop Docker containers"
	@echo "  clean          Remove Docker containers and images"
	@echo "  test           Run tests using Poetry"
	@echo "  shell          Open a shell in the Docker container"

# Build Docker image
build:
	docker-compose up --build


# Run Docker containers
run:
	docker-compose up

# Stop Docker containers
stop:
	docker-compose down

# Remove Docker containers and images
clean:
	docker-compose down -v --remove-orphans
	docker system prune -f

# Run tests using Poetry
test:
	poetry run python manage.py test

# Open a shell in the Docker container
shell:
	docker-compose run --rm web bash


migrations:
	docker-compose run web python manage.py makemigrations

migrate:
	docker-compose run web python manage.py migrate

