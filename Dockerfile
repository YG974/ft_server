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
		apt install php-mysql -y && \
		apt install php-fpm -y && \
		apt install wordpress -y && \
		apt install zsh -y && \
		apt install git -y && \
		tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz && \
		rm phpMyAdmin-5.0.2-all-languages.tar.gz && \
		mv phpMyAdmin-5.0.2-all-languages/ /etc/phpmyadmin && \
		mv ./config.inc.php /etc/phpmyadmin && \
		mv ./pokedex.com /etc/nginx/sites-available/ && \
		mv ./wp-config.php /etc/wordpress

EXPOSE	80 443
