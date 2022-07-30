#!/bin/sh
target=zerotier-containerized
ver=latest
images=spikhalskiy/$target:$ver
#images=sanwenjing/zerotier:20220730

#your networkid
netid=your_networkid


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
--device=/dev/net/tun \
--net=host \
--cap-add=NET_ADMIN \
--cap-add=SYS_ADMIN \
 -v /var/lib/zerotier-one:/var/lib/zerotier-one \
$images


#repo.local.com/$target:$ver
#sanwenjing/np:1.0
fi
echo "Visit web http://localhost/ via webrower"
#up tun service
modinfo tun
modprobe tun
lsmod|grep tun


#join network
docker exec zerotier-containerized zerotier-cli join $netid
docker exec zerotier-containerized zerotier-cli listnetworks



