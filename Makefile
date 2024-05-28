# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ofadhel <ofadhel@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/17 18:31:42 by ofadhel           #+#    #+#              #
#    Updated: 2024/05/28 18:02:04 by ofadhel          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.PHONY: create_env all down

create_env:
	@echo "Creating env file..."
	@touch srcs/.env
	@echo "CERTS_=/etc/ssl/certs/nginx-selfsigned.crt" >> ./srcs/.env
	@echo "DOMAIN_NAME=ofadhel.42.fr" >> ./srcs/.env
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
	fill_env_var "Enter your db user" "DB_USER"; \
	fill_env_var "Enter your db password" "DB_PASSWORD"; \
	fill_env_var "Enter your wp_title" "WP_TITLE"; \
	fill_env_var "Enter your wp_admin" "WP_ADMIN"; \
	fill_env_var "Enter your wp_admin_password" "WP_ADMIN_PASSWORD"; \
	fill_env_var "Enter your wp_admin_email" "WP_ADMIN_EMAIL"; \
	fill_env_var "Enter your ftp_user" "FTP_USER"; \
	fill_env_var "Enter your ftp_password" "FTP_PASSWORD"
	@echo ".env file created successfully."

all:
	./env.sh
	docker-compose -f srcs/docker-compose.yml up -d

down: docker-compose -f srcs/docker-compose.yml down -v
		rm -rf srcs/.env
