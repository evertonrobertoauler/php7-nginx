docker build -t php7-nginx .
docker run -d -p 80:80 -v /home/everton/programacao/php/atua2:/var/www/html php7-nginx
docker exec -ti $(docker ps -q) /bin/bash
