#!/bin/sh
target=alpine
images=repo.local.com/alpine:3.9.0

docker stop $target
docker rm $target
docker rmi $images
#echo "Rebuild for $images(y/n)"
#read key
#if [ $key = 'y' ]; then
#docker build -t $images .
docker images


#fi
