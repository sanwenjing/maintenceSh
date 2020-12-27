#!/bin/bash
#clear the old container
case $1 in
"del")
echo "del"$2
if [ !$2 ]; then
docker stop $2
docker rm $2
fi
;;
*)
echo "del containerName";;
esac




datapath=/home/mysql
echo "Create a server for mysql?(y/n)"
read key
if [ $key = 'y' ]; then
mkdir -p $datapath
chmod -R 777 $datapath
docker run --restart=always -d \
	-p 3306:3306 \
    -e MYSQL_ROOT_PASSWORD=123456 \
	-v $datapath/conf:/etc/mysql \
	-v $datapath/logs:/var/log/mysql \
	-v $datapath/data:/var/lib/mysql \
    --name mysql \
    repo.local.com/mysql:5.7.26

fi
echo "visit and Login after few minutes"

