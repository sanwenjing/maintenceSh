#!/bin/sh
target=vtiger_ssl
ver=7.4.0
images=repo.local.com/$target:$ver

echo "Remove all for $images(y/n)"
read key
if [ $key = 'y' ]; then
docker stop $target
docker rm $target
docker rmi $images
fi


echo "Rebuild for $images(y/n)"
read key
if [ $key = 'y' ]; then
docker build -t $images .
docker images
fi
echo "Building a server for $target?(y/n)"
read key
if [ $key = 'y' ]; then
docker run --restart=always -d \
    --name $target \
    --link mysql:mysql \
    -p 80:80 \
    -p 443:443 \
    -v /home/web/cert:/etc/nginx/cert \
repo.local.com/$target:$ver    
#sanwenjing/np:1.0
fi
echo "Visit web http://localhost/ via webrower"

