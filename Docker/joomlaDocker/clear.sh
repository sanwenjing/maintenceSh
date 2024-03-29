#!/bin/sh
target=joomla
ver=20210725
images=repo.local.com/$target:$ver

docker stop $target
docker rm $target
docker rmi $images
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
repo.local.com/$target:$ver    
#sanwenjing/np:1.0
fi
echo "Visit web http://localhost/ via webrower"

