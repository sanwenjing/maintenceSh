#!/bin/sh
sn=photo
echo "Building a server for $sn?(y/n)"
read key
if [ $key = 'y' ]; then

#mkdir
mkdir -p /$sn
chmod -R 777 /$sn

docker run --restart=always -d \
    --name $sn \
    -v /$sn:/html/upload \
    -p 8080:80 \
    repo.local.com/photo:1.0
    #sanwenjing/np:1.0
fi

#display 
docker ps 

echo "Visit web http://localhost/ via webrower"

