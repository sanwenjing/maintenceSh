#!/bin/sh
target=fusionpbx4.1.0-freeswitch1.6.10-debian
ver=1.6.10
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
docker run -d --restart=always --net=host --privileged --name fusionpbx \
$images
docker logs $target
docker exec fusionpbx sudo -u postgres psql -c "ALTER USER fusionpbx WITH PASSWORD '123456';"
fi
echo "Visit web http://localhost/ via webrower"


