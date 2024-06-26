#!/bin/sh
sn=alpine
echo "Building a server for $sn?(y/n)"
read key
if [ $key = 'y' ]; then
docker run --restart=always -it -d \
    --name $sn \
    repo.local.com/alpine:3.9.0 sh
    #sanwenjing/np:1.0
fi
echo "$sn built"
docker exec -it $sn sed -i "s/alpine.gliderlabs.com/repo.local.com:8080/g" /etc/apk/repositories
