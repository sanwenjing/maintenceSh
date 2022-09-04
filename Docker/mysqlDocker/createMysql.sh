#!/bin/bash
#clear the old container
echo "Welcome to create mysql panel!Please input your choice."
echo " "
echo "1.Install mysql 5.5."
echo "2.Install mysql 5.7."
echo "3.Install mariadb 10.4.15"

read key
case $key in
"1")
echo "1.Install mysql 5.5."

docker run --restart=always -d \
    -p 3306:3306 \
    -e MYSQL_ROOT_PASSWORD=123456 \
    -e MYSQL_DATABASE=testdb \
    -e MYSQL_USER=test \
    -e MYSQL_PASSWORD=123456 \
    -v /home/data/mysql55/conf:/etc/mysql \
    -v /home/data/mysql55/logs:/var/log/mysql \
    -v /home/data/mysql55/data:/var/lib/mysql \
    --name mysql55 \
    repo.local.com/mysql:5.5
;;
"2")
echo "2.Install mysql 5.7."
docker run --restart=always -d \
    -p 3307:3306 \
    -e MYSQL_ROOT_PASSWORD=123456 \
    -e MYSQL_DATABASE=testdb \
    -e MYSQL_USER=test \
    -e MYSQL_PASSWORD=123456 \
    -v /home/data/mysql57/conf:/etc/mysql \
    -v /home/data/mysql57/logs:/var/log/mysql \
    -v /home/data/mysql57/data:/var/lib/mysql \
    --name mysql57 \
    repo.local.com/mysql:5.7.26
;;
"3")
echo "3.Install mariadb 10.4.15"
docker run --restart=always -d \
    -p 3308:3306 \
    -e MYSQL_ROOT_PASSWORD=123456 \
    -e MYSQL_DATABASE=testdb \
    -e MYSQL_USER=test \
    -e MYSQL_PASSWORD=123456 \
    -v /home/data/mariadb/:/var/lib/mysql \
    --name mariadb \
    repo.local.com/apline-mariadb:10.4.15
;;

*)
exit 0
esac



