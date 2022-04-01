#!/bin/sh
target=teamspeak
ver=3.13.6
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
-p 9987:9987/udp \
-p 30033:30033 \
-p 10011:10011 \
-e TS3SERVER_LICENSE=accept \
-v /teamspeak:/data \
$images
#sanwenjing/np:1.0
docker logs $target
fi
#echo "Visit web http://localhost/ via webrower"
echo "connect via client"

