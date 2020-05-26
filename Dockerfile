FROM debian:buster

LABEL ygeslin <ygeslin@student.42.fr>

WORKDIR	.

# Copy settings 
COPY	srcs/phpMyAdmin-5.0.2-all-languages.tar.gz .
COPY 	srcs/wp-config.php .
COPY	srcs/config.inc.php .
COPY	srcs/pokedex.com .
COPY	srcs/entrypoint.sh .
COPY	srcs/index.html .

# Apt update and install NGINX MARIADB WORDPRESS VIM ZSH PHP
RUN		apt update && \
		apt install -y nginx \
		 mariadb-server \
		 wordpress \
		 openssl \
		 vim \
		 zsh \
		 php php-mysql php-fpm php-mbstring php-cgi

# Install phpMyAdmin form .tar file
RUN		tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz && \
		rm phpMyAdmin-5.0.2-all-languages.tar.gz && \
		mkdir -p /var/lib/phpmyadmin/tmp && \
		mkdir -p /etc/phpmyadmin/ && \
		chown -R www-data:www-data /var/lib/phpmyadmin

# Moving settings 
RUN		mv phpMyAdmin-5.0.2-all-languages/ /usr/share/phpmyadmin && \
		mv ./config.inc.php /usr/share/phpmyadmin && \
		mv ./pokedex.com /etc/nginx/sites-available/ && \
		mv ./wp-config.php /usr/share/wordpress/ && \
		mv ./index.html /var/www/html/ && \
		ln -s /etc/nginx/sites-available/pokedex.com /etc/nginx/sites-enabled/pokedex.com 

# a mettre au propre apres
RUN		chmod +x ./entrypoint.sh

EXPOSE	80 443

#starting NGING MYSQL PHP
#ENTRYPOINT ["./entrypoint.sh"]
