# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ofadhel <ofadhel@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/17 18:31:42 by ofadhel           #+#    #+#              #
#    Updated: 2024/06/07 14:31:17 by ofadhel          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	sudo rm -rf /home/$(USER)/data/mariadb /home/$(USER)/data/wordpress
	sudo rm -rf srcs/.env
	@echo "Creating env file..."
	@touch srcs/.env
	@echo "USER=$(USER)" >> ./srcs/.env
	@echo "CERTS=/etc/nginx/ssl/nginx.crt" >> ./srcs/.env
	@echo "KEYS=/etc/nginx/ssl/nginx.key" >> ./srcs/.env
	@echo "DOMAIN_NAME=$(USER).42.fr" >> ./srcs/.env
	@fill_env_var() { \
		read -p "$$1: " value; \
		if [ -z "$$value" ]; then \
			echo "ERROR: $$1 cannot be empty"; \
			rm -rf srcs/.env; \
			exit 1; \
		fi; \
		echo "$$2=$$value" >> ./srcs/.env; \
	}; \
	fill_env_var "Enter your db name" "DB_NAME"; \
	fill_env_var "Enter your db root password" "DB_ROOT_PASSWORD"; \
	fill_env_var "Enter your db user" "DB_USER"; \
	fill_env_var "Enter your db password" "DB_PASSWORD"; \
	fill_env_var "Enter your wp_title" "WP_TITLE"; \
	fill_env_var "Enter your wp_admin" "WP_ADMIN"; \
	fill_env_var "Enter your wp_admin_password" "WP_ADMIN_PASSWORD"; \
	fill_env_var "Enter your wp_admin_email" "WP_ADMIN_EMAIL"; \
	fill_env_var "Enter your wp user" "WP_USER"; \
	fill_env_var "Enter your wp user password" "WP_USER_PASSWORD"; \
	fill_env_var "Enter your wp user email" "WP_USER_EMAIL";
	@echo ".env file created successfully."
	@echo "\033[0;33mCHECK THAT EMAIL IS IN THE RIGHT FORMAT!!!\033[0m"
	@read -p "Do you want to continue? [y/n]: " answer; \
	if [ "$$answer" != "y" ]; then \
		rm -rf srcs/.env; \
		exit 1; \
	fi

	mkdir /home/$(USER)/data/mariadb
	mkdir /home/$(USER)/data/wordpress

	sudo chown -R $(whoami):$(whoami) /home/$(USER)/data/mariadb
	sudo chown -R $(whoami):$(whoami) /home/$(USER)/data/wordpress
	sudo chmod -R 755 /home/$(USER)/data/wordpress
	sudo chmod -R 755 /home/$(USER)/data/mariadb
	sudo sed -i 's/127.0.0.1	localhost/127.0.0.1	localhost $(USER).42.fr/' /etc/hosts

	sed -i "s/user_to_change/${USER}/g" "srcs/docker-compose.yml"
	sudo docker-compose -f srcs/docker-compose.yml up --build -d

up:
	sudo docker-compose -f srcs/docker-compose.yml up --build -d

down:
	sudo docker-compose -f srcs/docker-compose.yml down -v --remove-orphans --rmi all
	sudo rm -rf /home/$(USER)/data/mariadb /home/$(USER)/data/wordpress
	sudo rm -rf srcs/.env
