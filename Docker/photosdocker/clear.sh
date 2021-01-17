#!/bin/sh
target=photo
images=repo.local.com/photo:1.0

docker stop $target
docker rm $target
docker rmi $images
echo "Rebuild for $images(y/n)"
read key
if [ $key = 'y' ]; then
docker build -t $images .
docker images
./create.sh

fi
