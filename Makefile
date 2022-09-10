include srcs/.env 

NAME=inception
COMPOSE=sudo docker-compose -f srcs/docker-compose.yml -p $(NAME)
RM=sudo rm -rf
MKDIR=sudo mkdir -m 777 -p
CHMOD=sudo chmod -R 777
CHOWN=sudo chown -R crochu

all: .up

.up:
	$(MKDIR) $(WP_HOST_VOLUME_PATH)
	$(MKDIR) $(MARIADB_HOST_VOLUME_PATH)
	$(CHOWN) $(DATA_VOLUME_PATH)
	$(CHMOD) $(DATA_VOLUME_PATH)
	sudo grep '127.0.0.1 lsuardi.42.fr' /etc/hosts || echo '127.0.0.1 lsuardi.42.fr' >> /etc/hosts
	sudo docker network inspect $(NETWORK_NAME) >/dev/null 2>&1 || sudo docker network create $(NETWORK_NAME)
	$(COMPOSE) up -d --build

stop:
	$(COMPOSE) stop

start:
	$(COMPOSE) up

clean:
	$(COMPOSE) down -v
	sudo docker system prune --volumes --force --all
	sudo docker image prune --all --force

fclean:	clean
	$(RM) $(DATA_VOLUME_PATH)

re:	fclean all

.PHONY: all .up clean fclean re stop start
