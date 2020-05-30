#!/bin/bash

service mysql start
mariadb < dbinit.sql

service php7.3-fpm start

nginx -g 'daemon off;'
