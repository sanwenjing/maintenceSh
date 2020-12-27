#!/bin/bash
#clear the old container
case $1 in
"del")
echo "del"$2
if [ !$2 ]; then
docker stop $2
docker rm $2
fi
;;
*)
echo "del containerName";;
esac




datapath=/home/pan
echo "Create a server for Pan?(y/n)"
read key
if [ $key = 'y' ]; then
mkdir -p $datapath
chmod -R 777 $datapath
docker run -dit --restart=always \
--name=pan \
-v $datapath:/var/www/html/system/data/default_home_folder  \
-p 80:80 -p 6800:6800 \
jaegerdocker/pan
fi
echo "visit http://localhost/ Login with superuser/superuser after few minutes"
echo "visit AriaNg:http://yourdomain.com:8081/dweb"

