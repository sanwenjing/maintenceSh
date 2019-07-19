#!/bin/bash
#echo "enter the port: "
#read port
firewall-cmd --list-all

#firewall-cmd --zone=public --add-port=80/tcp --permanent
#说明:
#–zone #作用域
#–add-port=80/tcp #添加端口，格式为：端口/通讯协议
#–permanent 永久生效，没有此参数重启后失效
 
#多个端口:
#firewall-cmd --zone=public --add-port=80-90/tcp --permanent
