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
3.查看仓库
http://192.168.92.134:5000/v2/_catalog

