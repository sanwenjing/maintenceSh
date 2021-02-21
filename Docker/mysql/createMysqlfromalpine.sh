#!/bin/bash

datapath=/home/mysql
echo "Create a server for mysql?(y/n)"
read key
if [ $key = 'y' ]; then
mkdir -p $datapath
chmod -R 777 $datapath
docker run --restart=always -d \
        -p 3306:3306 \
    -e MYSQL_ROOT_PASSWORD=123456 \
    -e MYSQL_DATABASE=testdb \
    -e MYSQL_USER=test \
    -e MYSQL_PASSWORD=123456 \
    -v $datapath/:/var/lib/mysql \
    --name mysql \
repo.local.com/apline-mariadb:10.4.15
#yobasystems/alpine-mariadb
fi
echo "visit and Login after few minutes"
