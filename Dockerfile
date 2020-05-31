# build : docker build -t ygeslin/ftserver:latest .
# run : docker run -d -p 80:80 -p 443:443 ygeslin/ftserver:latest

FROM debian:buster

ARG PHPMYADMIN_VERSION=5.0.2

LABEL MAINTAINER="ygeslin <ygeslin@student.42.fr>"

WORKDIR	/src

# Apt update and install NGINX MARIADB WORDPRESS VIM ZSH PHP OPENSLL TMUX
RUN		apt update && apt install -y \
		 nginx \
		 mariadb-server \
		 wordpress \
		 openssl \
		 vim \
		 zsh \
		 tmux \
		 php \
		 php-mysql \
		 php-fpm \
		 php-mbstring \
		 php-cgi

# Copy settings 
COPY	srcs/wp-config.php \
		srcs/config.inc.php \
		srcs/pokedex.com.conf \
		srcs/entrypoint.sh \
		srcs/dbinit.sql \
		srcs/.vimrc \
		./

# Download and install phpMyAdmin
ADD 	https://files.phpmyadmin.net/phpMyAdmin/$PHPMYADMIN_VERSION/phpMyAdmin-$PHPMYADMIN_VERSION-all-languages.tar.gz .

RUN 	tar -xvf phpMyAdmin-$PHPMYADMIN_VERSION-all-languages.tar.gz

# Download and install mkcert, SSL certifier
ADD 	https://github.com/FiloSottile/mkcert/releases/download/v1.3.0/mkcert-v1.3.0-linux-amd64 .
RUN 	mv mkcert-v1.3.0-linux-amd64 mkcert && \
		chmod +x mkcert && \
		mv mkcert /usr/local/bin && \
		mkcert -install

# Moving settings 
RUN		mkdir -p /var/www/monsite && \
		mv phpMyAdmin-$PHPMYADMIN_VERSION-all-languages/ /var/www/monsite/phpmyadmin && \
		mv /usr/share/wordpress /var/www/monsite/wordpress && \
		mv config.inc.php /var/www/monsite/phpmyadmin && \
		mv pokedex.com.conf /etc/nginx/sites-available/ && \
		mv wp-config.php /var/www/monsite/wordpress/ && \
		mv .vimrc ~/.

RUN		ln -s /etc/nginx/sites-available/pokedex.com.conf /etc/nginx/sites-enabled/

# Setting SSL certificates
RUN 	mkdir -p /etc/nginx/keys/localhost && \
		mkcert localhost && \
		mv localhost.pem /etc/nginx/keys/localhost/. && \
		mv localhost-key.pem /etc/nginx/keys/localhost/. 

# a mettre au propre apres
RUN		chmod +x ./entrypoint.sh

EXPOSE	80 443

#starting NGING MYSQL PHP
#ENTRYPOINT ["sh", "-c", "./entrypoint.sh"]
