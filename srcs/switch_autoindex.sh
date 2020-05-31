#!/bin/bash

if grep -q "autoindex on" /etc/nginx/sites-available/pokedex.com.conf
then
	sed -i 's/autoindex on/autoindex off/g' pokedex.com.conf;
	echo "The autoindex is now disabled. Restart Nginx to apply changes.";
elif grep -q "autoindex off" /etc/nginx/sites-available/pokedex.com.conf
then
	sed -i 's/autoindex off/autoindex on/g' pokedex.com.conf;
	echo "The autoindex is now enabled. Restart Nginx to apply changes.";
fi
