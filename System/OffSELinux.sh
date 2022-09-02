echo "Are your want to turn off the SELinux?(y/n)"
read key
if [ $key = 'y' ]; then
setenforce 0
sed -i "s/SELINUX=enforcing/SELINUX=disabled/g" /etc/selinux/config
fi

