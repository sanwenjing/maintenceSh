#!/bin/sh
target=esphome
ver=20220306
images=repo.local.com/$target:$ver
#images=esphome/esphome:latest

echo "clear $target and delete $images(y/n)"
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
echo "Mission completed!"
fi


echo "Building a server for $sn?(y/n)"
read key
if [ $key = 'y' ]; then
docker run --restart=always -d -it \
--net=host \
    --name $target \
repo.local.com/$target:$ver
#sanwenjing/np:1.0
fi
echo "Visit web http://localhost:6052/ via webrower"

