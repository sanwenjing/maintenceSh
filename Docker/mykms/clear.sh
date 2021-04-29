#!/bin/sh
target=mykms
images=repo.local.com/mykms:1.0

docker stop $target
docker rm $target
docker rmi $images
echo "Rebuild for $images(y/n)"
read key
if [ $key = 'y' ]; then
docker build -t $images .
docker images


fi
#building a server
echo "Building a server for $target?(y/n)"
#docker run -d --name showdoc -p 4999:80 showdoc
read key
if [ $key = 'y' ]; then
docker run --restart=always -d \
    --name $target \
    -p 1688:1688 \
    repo.local.com/$target:1.0
    #sanwenjing/np:1.0
fi
echo "Visit web http://localhost/ via webrower"

