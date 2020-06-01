# ft_server
  School project at 42.
  ## Purpose
This project is an introduction to __system administration__.  
It highlights the importance of using __scripts__ to automate tasks.  
It uses __docker__ technology to install a complete web server. This server will run multiples services:  
* __Wordpress__  
* __PhpMyAdmin__  
* __A SQL database__
    
  ## How to run the programme
Make sure Docker Desktop is running and you are in the ft_server directory.  
* To build the docker image :  
Run `docker build -t ft_server .`
* To run the docker image, and access to the services :  
Run `docker run -p 80:80 -p 443:443 -d ft_server .`  
  
The services are now running.  
  
   ## How to access services
* You can now access the __autoindex__ page at http://localhost or https://localhost.  
From the index, you can __click__ on __wordpress__ or __phpmyadmin__ to access services.  
* You can also access directly services at :  
-> __WordPress__ : http://localhost/wordpress or https://localhost/wordpress  
-> __PhpMyAdmin__ : http://localhost/phpmyadmin or https://localhost/phpmyadmin  

  ## How to disable the autoindex
* To disable the autoindex :  
Run `docker exec [container ID] sh switch_autoindex.sh`  
* To apply changes, you need to restart nginx :  
Run `docker exec [container ID] service nginx restart`
* To get the container ID :  
Run `docker ps`  

Now, you can't access anymore the index at http://localhost or https://localhost.  
  
But you still can access services at  
-> __WordPress__ : http://localhost/wordpress or https://localhost/wordpress  
-> __PhpMyAdmin__ : http://localhost/phpmyadmin or https://localhost/phpmyadmin  
