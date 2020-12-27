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




datapath=/home/showdoc
echo "Create a server for showdoc?(y/n)"
read key
if [ $key = 'y' ]; then
mkdir -p $datapath
chmod -R 777 $datapath
docker run -d --restart=always \
-v showdoc:/var/www/html/ \
    --name showDoc \
    -p 8880:80 \
    repo.local.com/showdoc:latest
fi
echo "visit and Login after few minutes"

