#!/bin/sh
target=eyeos
ver=2.5
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
