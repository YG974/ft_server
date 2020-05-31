#!/bin/bash

service mysql start
mariadb < dbinit.sql

service php7.3-fpm start

service nginx restart
tail -f /dev/null
#nginx -g 'daemon off;'
