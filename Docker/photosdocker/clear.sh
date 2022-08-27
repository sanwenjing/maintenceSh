#!/bin/sh
target=photo
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

#mkdir
mkdir -p /home/data/$target
chmod -R 777 /home/data/$target

docker run --restart=always -d \
    --name $target \
    -v /home/data/$target:/html/upload \
    -p 8080:80 \
$images
docker logs $target
fi
echo "Visit web http://localhost/ via webrower"



