#!/bin/sh
echo "Yum use Aliyun source?(y/n)"



read key
if [ $key = 'y' ]; then
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
yum clean all && yum makecache

fi

