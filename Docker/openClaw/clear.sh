#!/bin/sh
target=ssh-alpine
ver=1.0
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
    -e ROOT_PASSWORD=admin123 \
    -p 2222:22 \
    -v /html:/html \
$images
docker logs $target
fi
echo "Visit web http://localhost/ via webrower"


