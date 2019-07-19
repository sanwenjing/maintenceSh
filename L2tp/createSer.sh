docker pull hwdsl2/ipsec-vpn-server
sudo modprobe af_key
mkdir -p /usr/local/vpn
touch /usr/local/vpn/vpn.env
echo "Input VPN_IPSEC_PSK:"
read psk
echo "Input VPN_USER:"
read user
echo "Input VPN_PASSWORD:"
read passwd
echo "VPN_IPSEC_PSK="$psk
echo "VPN_USER="$user
echo "VPN_PASSWORD="$passwd
echo "Are your sure to create a server now?(y/n)"
read input
if [ $input = 'y' ]; then 
echo "VPN_IPSEC_PSK="$psk>>/usr/local/vpn/vpn.env
echo "VPN_USER="$user>>/usr/local/vpn/vpn.env
echo "VPN_PASSWORD="$passwd>>/usr/local/vpn/vpn.env
docker run \
    --name ipsec-vpn-server \
    --env-file /usr/local/vpn/vpn.env \
    --restart=always \
    -p 500:500/udp \
    -p 4500:4500/udp \
    -v /lib/modules:/lib/modules:ro \
    -d --privileged \
    hwdsl2/ipsec-vpn-server
fi
