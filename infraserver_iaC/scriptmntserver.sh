#!/bin/bash

#Script base para conclusao da atividade
#Infraestrutura como codigo
#provisionamento de um servidor apache

#preparacao do ambiente
apt-get update
apt-get upgrade -y
apt-get install apache2 -y
apt-get install unzip -y

#instalando aplicacao
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip /tmp/main.zip
cp -R /tmp/linux-site-dio/main/* /var/www/html/

echo "finalizado..." 
