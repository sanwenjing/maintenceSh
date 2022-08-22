#!/bin/sh
target=discuz
ver=3.4
images=repo.local.com/$target:$ver

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

docker run --restart=always -d \
    --name $target \
    -p 80:80 \
$images
docker logs $target
fi
echo "Visit web http://localhost/ via webrower"


