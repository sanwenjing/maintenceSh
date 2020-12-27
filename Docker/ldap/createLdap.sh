#!/bin/bash
#clear the old container
case $1 in
"del")
echo "del"$2
if [ !$2 ]; then
docker stop $2
docker rm $2
fi
;;
*)
echo "del containerName";;
esac



#step1 create ldap server
datapath=/home/ldap
echo "Create a server for ldap?(y/n)"
read key
if [ $key = 'y' ]; then
mkdir -p $datapath
chmod -R 777 $datapath

docker run --restart=always -d \
    -p 389:389 \
    -p 636:636 \
-v $datapath/ldap:/var/lib/ldap \
-v $datapath/slapd.d:/etc/ldap/slapd.d \
--name ldap \
-e LDAP_TLS=false \
-e LDAP_ORGANISATION="local" \
-e LDAP_DOMAIN="local.com" \
-e LDAP_ADMIN_PASSWORD="123456" \
-e LDAP_CONFIG_PASSWORD="123456" \
repo.local.com/openldap
#osixia/openldap

fi

#step2 create mgmt tools

echo "Create a server for tools?(y/n)"
read key
if [ $key = 'y' ]; then
docker run -dit \
--restart=always \
-p 19999:80 \
--link ldap \
--name ldap_mgr \
-e PHPLDAPADMIN_HTTPS=false \
-e PHPLDAPADMIN_LDAP_HOSTS=ldap \
repo.local.com/phpldapadmin:1.2.5
#osixia/phpldapadmin
fi

echo "visit and Login with "cn=admin,dc=local,dc=com/123456" after few minutes"

