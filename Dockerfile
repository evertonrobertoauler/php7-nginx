FROM docker.io/ubuntu

RUN apt-get update
RUN apt-get install -y software-properties-common git vim
RUN add-apt-repository ppa:nginx/stable
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y nginx php7.0 php7.0-fpm php7.0-gd php7.0-cgi php7.0-curl php7.0-json
RUN apt-get install -y php7.0-mbstring php7.0-mcrypt php7.0-pgsql php7.0-soap php7.0-xml php7.0-zip
RUN apt-get install -y build-essential unzip xmlsec1 zip libxmlsec1 libxmlsec1-openssl

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y postfix >> /dev/null || :
ADD config/postfix/filtro /etc/postfix/
ADD config/postfix/main.cf /etc/postfix/

RUN rm -v /etc/nginx/sites-enabled/default
ADD config/nginx/default /etc/nginx/sites-enabled/
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
ADD config/nginx/default /etc/nginx/sites-enabled/
ADD config/start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh
CMD ["/usr/local/bin/start.sh"]
