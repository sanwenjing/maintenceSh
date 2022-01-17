#!/bin/sh
target=emqttd
ver=2.3.6
images=repo.local.com/$target:$ver

echo "Building a server for $sn?(y/n)"
read key
if [ $key = 'y' ]; then
docker run --restart=always -d -it \
--name $target \
-p 18083:18083 \
-p 1883:1883 \
-p 8084:8084 \
-p 8883:8883 \
-p 8083:8083 \
$images
fi
echo "Visit web http://localhost:18083/ via webrower with admin/public"

