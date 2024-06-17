Docker本地私有仓库:
1.安装(服务器,如192.168.92.134)
关闭selinux
sestatus -v 查看状态
修改/etc/selinux/config文件。将SELINUX=enforcing改为SELINUX=disable，并重启系统.

下载并启动一个registry容器，-v指定镜像文件本地存放路径

docker run --restart=always -d -p 5000:5000 -v /opt/data/registry:/var/lib/registry --name private_registry registry

2.上传镜像(客户机)
使用docker tag命令将镜像标记为192.168.92.134:5000/test

docker tag ubuntu:18.04 192.168.92.134/test
推送到本地仓库

docker push 192.168.92.134:5000/test

注:如果上传失败
vim /usr/lib/systemd/system/docker.service
在--insecure-registry 127.0.0.1:5000处复制添加一行如下内容即可解决

--insecure-registry 192.168.92.134:5000
#新版本
vi /etc/docker/daemon.json
添加
{
  "insecure-registries": ["<your-server-ip>:5000"]
}
3.查看仓库
http://192.168.92.134:5000/v2/_catalog



#查看仓库镜像
curl hub.test.com:5000/v2/_catalog
#++++++++++++++++++++++++++++++
#registry开启删除
#查看默认配置
docker exec -it  registry sh -c 'cat /etc/docker/registry/config.yml'
#开启删除(添加  delete: enabled: true)
docker exec -it  registry sh -c "sed -i '/storage:/a\  delete:' /etc/docker/registry/config.yml"
docker exec -it  registry sh -c "sed -i '/delete:/a\    enabled: true' /etc/docker/registry/config.yml"
#重启
docker restart registry
#查询、删除镜像
#查询镜像
curl  <仓库地址>/v2/_catalog

#查询镜像tag(版本)
curl  <仓库地址>/v2/<镜像名>/tags/list

#删除镜像API
curl -I -X DELETE "<仓库地址>/v2/<镜像名>/manifests/<镜像digest_hash>"

#获取镜像digest_hash
curl  <仓库地址>/v2/<镜像名>/manifests/<tag> \
	--header "Accept: application/vnd.docker.distribution.manifest.v2+json"

