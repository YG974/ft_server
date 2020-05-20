FROM debian:buster

LABEL ygeslin <yann.geslin@hotmail.fr>

WORKDIR	.

COPY	srcs/phpMyAdmin-5.0.2-all-languages.tar.gz .
COPY 	srcs/wp-config.php .
COPY	srcs/config.inc.php .
COPY	srcs/pokedex.com .

RUN		apt update && \
		apt install nginx -y && \
		apt install vim -y && \
		apt install mariadb-server -y && \
		apt install php-mysql php-fpm php-mbstring -y && \
		apt install wordpress -y && \
		apt install zsh -y && \
		apt install git -y && \
		tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz && \
		rm phpMyAdmin-5.0.2-all-languages.tar.gz && \
		mv phpMyAdmin-5.0.2-all-languages/ /usr/share/phpmyadmin && \
		mv ./config.inc.php /usr/share/phpmyadmin && \
		mv ./pokedex.com /etc/nginx/sites-available/ && \
		ln -s /etc/nginx/sites-available/pokedex.com /etc/nginx/sites-enabled/pokedex.com && \
		mv ./wp-config.php /usr/share/wordpress/

EXPOSE	80 443
