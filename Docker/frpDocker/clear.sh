#!/bin/sh
target=alpine-frp
ver=0.37
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
