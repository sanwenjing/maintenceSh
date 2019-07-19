echo "enter the UDP port: "
read port
firewall-cmd --add-port=$port/udp --permanent
