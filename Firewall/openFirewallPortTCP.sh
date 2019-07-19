echo "enter the TCP port: "
read port
firewall-cmd --add-port=$port/tcp --permanent
