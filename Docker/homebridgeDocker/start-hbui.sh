#!/bin/sh
target=homebridge-ui
ver=1.0
images=repo.local.com/$target:$ver

echo "Building a server for $sn?(y/n)"
read key
if [ $key = 'y' ]; then
docker run --restart=always -d -it \
--name $target \
-e TZ=Australia/Sydney \
-e PGID=1000 \
-e PUID=1000 \
-e HOMEBRIDGE_CONFIG_UI=1 \
-e HOMEBRIDGE_CONFIG_UI_PORT=8581 \
--net=host \
$images
fi
echo "Visit web http://localhost:8581/ via webrower"

