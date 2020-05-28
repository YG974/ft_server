FROM debian:buster

LABEL ygeslin <ygeslin@student.42.fr>

WORKDIR	.

# Copy settings 
COPY	srcs/phpMyAdmin-4.9.2-all-languages.tar.gz .
#COPY	srcs/phpMyAdmin-5.0.2-all-languages.tar.gz .
COPY 	srcs/wp-config.php .
COPY	srcs/config.inc.php .
COPY	srcs/pokedex.com .
COPY	srcs/entrypoint.sh .
COPY	srcs/DB_creation.sql .
COPY	srcs/.vimrc .

# Apt update and install NGINX MARIADB WORDPRESS VIM ZSH PHP OPENSLL TMUX
RUN		apt update && \
		apt install -y nginx \
		 mariadb-server \
		 wordpress \
		 openssl \
		 vim \
		 zsh \
		 tmux \
		 php php-mysql php-fpm php-mbstring php-cgi

# Install phpMyAdmin form .tar file
#RUN		tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz && \
RUN		tar -xvf phpMyAdmin-4.9.2-all-languages.tar.gz && \
#		rm phpMyAdmin-5.0.2-all-languages.tar.gz && \
		rm phpMyAdmin-4.9.2-all-languages.tar.gz && \
		mkdir -p /var/lib/phpmyadmin/tmp && \
		mkdir -p /etc/phpmyadmin 

# Moving settings 
RUN		mkdir -p /usr/share/monsite && \
#		mv phpMyAdmin-5.0.2-all-languages/ /usr/share/monsite/phpmyadmin && \
		mv phpMyAdmin-4.9.2-all-languages/ /usr/share/monsite/phpmyadmin && \
		mv /usr/share/wordpress /usr/share/monsite/wordpress && \
		mv /config.inc.php /usr/share/monsite/phpmyadmin && \
		mv /pokedex.com /etc/nginx/sites-available/ && \
		mv /wp-config.php /usr/share/monsite/wordpress/ && \
		mv .vimrc ~/. && \
		ln -s /etc/nginx/sites-available/pokedex.com /etc/nginx/sites-enabled/pokedex.com 

# a mettre au propre apres
RUN		chmod +x ./entrypoint.sh

EXPOSE	80 443

#starting NGING MYSQL PHP
ENTRYPOINT ["bash"]
