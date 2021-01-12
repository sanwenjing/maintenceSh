#!/bin/sh
target=ost
images=repo.local.com/ost:1.15.1

docker stop $target
docker rm $target
docker rmi $images
echo "Rebuild for $images(y/n)"
read key
if [ $key = 'y' ]; then
docker build -t $images .
docker images


fi
