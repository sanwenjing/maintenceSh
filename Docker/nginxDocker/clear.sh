#!/bin/sh
target=alpine-nginx-repo
ver=1.14.2
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
