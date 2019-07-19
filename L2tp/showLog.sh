docker ps |grep ipsec-vpn-server|awk '{print $1}'|xargs docker logs
