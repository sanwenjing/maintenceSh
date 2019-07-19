echo "enter the UDP port: "
read port
firewall-cmd --remove-port=$port/udp --permanent
firewall-cmd --reload
