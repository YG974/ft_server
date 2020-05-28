#!/bin/bash

service php7.3-fpm start
service mysql start
service nginx start
mariadb < /DB_creation.sql
service --status-all
