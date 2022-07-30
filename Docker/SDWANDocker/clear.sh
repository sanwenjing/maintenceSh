#!/bin/sh
target=ztncui
ver=latest
images=keynetworks/$target:$ver

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
-e HTTP_PORT=4000 \
-e HTTP_ALL_INTERFACES=yes \
-e ZTNCUI_PASSWD=test@123 \
-p 4000:4000 \
$images


#repo.local.com/$target:$ver
#sanwenjing/np:1.0
fi
echo "Visit web http://localhost/ via webrower"

