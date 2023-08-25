#!/bin/sh
echo "Mount form nfs?(y/n)"

vol=/home/data/nfs
serv_nfs=192.168.31.83
data_share=/volume1/sharefile


read key
if [ $key = 'y' ]; then
yum -y install rpcbind

showmount -e $serv_nfs
#Export list for 192.168.2.202
#/data/share 192.168.2.202

mkdir -p $vol
mount -t nfs $serv_nfs:$data_share $vol/ -o nolock,nfsvers=3,vers=3
#join list on start 
echo "mount -t nfs $serv_nfs:$data_share $vol/ -o nolock,nfsvers=3,vers=3">>/etc/rc.d/rc.local
df -h

fi

