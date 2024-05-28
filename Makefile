# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ofadhel <ofadhel@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/17 18:31:42 by ofadhel           #+#    #+#              #
#    Updated: 2024/05/28 16:04:13 by ofadhel          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

create_env:
	@echo "Creating env file..."
	@touch srcs/.env
	@echo "CERTS_=/etc/ssl/certs/nginx-selfsigned.crt" >> ./srcs/.env
	@echo "DOMAIN_NAME=ofadhel.42.fr" >> ./srcs/.env \

	@read -p "Enter your db name: " db_name; \
	if [ -z "$$db_name" ]; then \
		echo "ERROR: db name cannot be empty"; \
		rm -rf srcs/.env; \
		exit 1; \
	fi; \
	echo "DB_NAME=$$db_name" >> ./srcs/.env
	@read -p "Enter your db user: " db_user; \
	if [ -z "$$db_user" ]; then \
		echo "ERROR: db user cannot be empty"; \
		rm -rf srcs/.env; \
		exit 1; \
	fi; \
	echo "DB_USER=$$db_user" >> ./srcs/.env
	@read -p "Enter your db password: " db_password; \
	if [ -z "$$db_password" ]; then \
		echo "ERROR: db password cannot be empty"; \
		rm -rf srcs/.env; \
		exit 1; \
	fi; \
	echo "DB_PASSWORD=$$db_password" >> ./srcs/.env

	@read -p "Enter your wp_title: " wp_title; \
	if [ -z "$$wp_title" ]; then \
		echo "ERROR: wp title cannot be empty"; \
		rm -rf srcs/.env; \
		exit 1; \
	fi; \
	echo "WP_TITLE=$$wp_title" >> ./srcs/.env
	@read -p "Enter your wp_admin: " wp_admin; \
	if [ -z "$$wp_admin" ]; then \
		echo "ERROR: wp admin cannot be empty"; \
		rm -rf srcs/.env; \
		exit 1; \
	fi; \
	echo "WP_ADMIN=$$wp_admin" >> ./srcs/.env
	@read -p "Enter your wp_admin_password: " wp_admin_password; \
	if [ -z "$$wp_admin_password" ]; then \
		echo "ERROR: wp admin password cannot be empty"; \
		rm -rf srcs/.env; \
		exit 1; \
	fi; \
	echo "WP_ADMIN_PASSWORD=$$wp_admin_password" >> ./srcs/.env
	@read -p "Enter your wp_admin_email: " wp_admin_email; \
	if [ -z "$$wp_admin_email" ]; then \
		echo "ERROR: wp admin email cannot be empty"; \
		rm -rf srcs/.env; \
		exit 1; \
	fi; \
	echo "WP_ADMIN_EMAIL=$$wp_admin_email" >> ./srcs/.env

	@read -p "Enter your ftp_user: " ftp_user; \
	if [ -z "$$ftp_user" ]; then \
		echo "ERROR: ftp user cannot be empty"; \
		rm -rf srcs/.env; \
		exit 1; \
	fi; \
	echo "FTP_USER=$$ftp_user" >> ./srcs/.env
	@read -p "Enter your ftp_password: " ftp_password; \
	if [ -z "$$ftp_password" ]; then \
		echo "ERROR: ftp password cannot be empty"; \
		rm -rf srcs/.env; \
		exit 1; \
	fi; \
	echo "FTP_PASSWORD=$$ftp_password" >> ./srcs/.env


all:
	./env.sh
	docker-compose -f srcs/docker-compose.yml up -d

down: docker-compose -f srcs/docker-compose.yml down
		rm -rf srcs/.env
