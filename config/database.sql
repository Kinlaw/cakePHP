#!/bin/bash
#
# Hey, this is minimal
# curl -L gist-raw-url | bash
#
#sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y php5-cli git php5-mcrypt php5-intl screen cowsay mysql-server php5-mysql && \
sudo ln -s /etc/php5/mods-available/mcrypt.ini /etc/php5/cli/conf.d/20-mcrypt.ini && \
echo "downloading composer" && \
curl -sS https://getcomposer.org/installer | php && \
echo "creating CakePHP project" && \
php composer.phar create-project -s dev cakephp/app cakefest && \
cd cakefest/src && \
screen -d -m Console/cake server -H $HOSTNAME -p 8080 && \
cowsay "Mouuuuuuuuuu, er, CakePHP 3.0 installed. please point your browser to http://$HOSTNAME.cloudapp.net"