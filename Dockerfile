FROM debian:buster

LABEL ygeslin <yann.geslin@hotmail.fr>

WORKDIR	.

RUN		apt update \
		apt install nginx -y && \
		apt install vim -y && \
		apt install php-mysql -y && \
		apt install wordpress -y && \
		apt install zsh -y && \
		apt install git -y && \
		tar -xvf phpMyAdmin-5.0.2-all-languages.tar.g && \
		rm phpMyAdmin-5.0.2-all-languages.tar.g && \
		mv phpMyAdmin-5.0.2-all-languages/ /etc/phpmyadmi && \
		mv ./config.inc.php /etc/phpmyadmi && \
		mv ./wp-config.php /etc/wordpres

COPY	srcs/phpMyAdmin-5.0.2-all-languages.tar.gz .
COPY 	srcs/wp-config.php .
COPY	srcs/config.inc.php .

