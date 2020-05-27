#WORDPRESS DB
CREATE DATABASE DB_pokemon;
USE DB_pokemon;
CREATE TABLE pokedex (name VARCHAR(20), lvl SMALLINT(100), type VARCHAR(20));
INSERT INTO pokedex VALUES ('pikachu',25,'eclair');
INSERT INTO pokedex VALUES ('salameche',22,'feu');
INSERT INTO pokedex VALUES ('carapuce',18,'eau');

#PHPMYADMIN USER
CREATE USER 'ygeslin'@'localhost' IDENTIFIED BY 'pikapika';
GRANT ALL PRIVILEGES ON DB_pokemon.* TO 'ygeslin'@'localhost' WITH GRANT OPTION;
