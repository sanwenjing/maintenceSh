uname -r
yum remove docker  docker-common docker-selinux docker-engine
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum list docker-ce --showduplicates | sort -r
yum -y install docker-ce  #由于repo中默认只开启stable仓库，故这里安装的是最新稳定版17.12.0
systemctl start docker
systemctl enable docker
docker version
