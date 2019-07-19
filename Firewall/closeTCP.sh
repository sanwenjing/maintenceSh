echo "enter the TCP port: "
read port
firewall-cmd --remove-port=$port/tcp --permanent
firewall-cmd --reload
