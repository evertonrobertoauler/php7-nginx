# Container docker PHP7 + Nginx

##Build

    docker build -t php7-nginx .
    
##Start

    docker run -d -p 80:80 -v /home/everton/programacao/php/atua:/var/www/html php7-nginx

##Bash

    docker exec -ti $(docker ps -q) /bin/bash
