#!/bin/sh
target=alpine_nginx_ssl
ver=20220723
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
    -p 80:80 \
    -p 443:443 \
    --link mysql:mysql \
    -v /home/web/cert:/etc/nginx/cert \
    -v /home/web:/html \
$images    
#sanwenjing/np:1.0
fi
echo "Visit web http://localhost/ via webrower"

