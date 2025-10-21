LOGIN	= kzhen-cl

all: up

up:
	@mkdir -p /home/$(LOGIN)/data
	@mkdir -p /home/$(LOGIN)/data/mariadb
	@mkdir -p /home/$(LOGIN)/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml up -d

down:
	@echo "Inception: Containers downed"
	@docker compose -f ./srcs/docker-compose.yml down

clean: down
	@echo "Inception: /home/$(LOGIN)/data deleted"
	@rm -rf /home/$(LOGIN)/data

fclean: clean
	@echo "Container images deleted"
	@docker system prune -af

re: fclean all

.PHONY:
	all up down clean fclean re
