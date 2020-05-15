FROM debian:buster

LABEL ygeslin <yann.geslin@hotmail.fr>

WORKDIR	.

COPY	srcs/phpMyAdmin-5.0.2-all-languages.tar.gz .
COPY	srcs/oh-my-zsh.sh .
COPY 	srcs/wp-config.php .

RUN	apt update
RUN	apt install nginx -y
RUN	apt install vim -y
RUN	apt install php-mysql -y
RUN	apt install wordpress -y
RUN	apt install zsh -y
RUN	apt install git -y
RUN	apt install curl -y
RUN 	bash oh-my-zsh.sh -y
RUN	tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN	rm phpMyAdmin-5.0.2-all-languages.tar.gz
RUN	mv phpMyAdmin-5.0.2-all-languages/ /usr/share/phpmyadmin


