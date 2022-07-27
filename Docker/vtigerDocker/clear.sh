#!/bin/sh
target=vtiger
ver=7.1.0
#images=javanile/$target:$ver
images=repo.local.com/$target:$ver

echo "Remove all for $images(y/n)"
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
fi
echo "Building a server for $target?(y/n)"
read key
if [ $key = 'y' ]; then
docker run --restart=always -d \
    --name $target \
    -p 80:80 \
    -p 443:443 \
    -v /home/vtiger:/var/lib/vtiger \
    -e VT_SITE_URL=http://192.168.31.150 \
    -e MYSQL_HOST=app.local.com \
    -e MYSQL_ROOT_PASSWORD=123456 \
    -e MYSQL_DATABASE=vtiger \
$images
#repo.local.com/$target:$ver    
#sanwenjing/np:1.0
fi
echo "Visit web http://localhost/ via webrower"

