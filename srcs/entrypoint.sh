#!/bin/bash

service mysql start
mariadb < dbinit.sql

service php7.3-fpm start

service nginx start
#nginx -g 'daemon off;'
