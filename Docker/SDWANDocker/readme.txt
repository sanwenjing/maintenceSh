
cat /etc/sysctl.conf
#add ipv4.ip_forward=1
PHY_IFACE=ens33
ZT_IFACE=ztc25lwtc6
 
sudo iptables -t nat -A POSTROUTING -o $PHY_IFACE -j MASQUERADE
sudo iptables -A FORWARD -i $PHY_IFACE -o $ZT_IFACE -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i $ZT_IFACE -o $PHY_IFACE -j ACCEPT
iptables-save

Ex:
iptables -t nat -A POSTROUTING -o ens33 -j MASQUERADE
iptables -A FORWARD -i ens33 -o ztc25lwtc6 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i ztc25lwtc6 -o ens33 -j ACCEPT
iptables-save
