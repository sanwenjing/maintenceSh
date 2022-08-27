#!/bin/sh
target=db-api
ver=3.1.1
#images=freakchicken/$target:$ver
images=sanwenjing/$target:$ver

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
    -p 8520:8520 \
    -it \
$images standalone
docker logs $target
fi
echo "Visit web http://localhost/ via webrower"


