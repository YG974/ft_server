FROM debian:buster

LABEL ygeslin <yann.geslin@hotmail.fr>

WORKDIR	.

RUN	apt update
RUN	apt install nginx -y
COPY	srcs/phpMyAdmin-5.0.2-all-languages.tar.gz .


