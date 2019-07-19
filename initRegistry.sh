docker run -d -p 5000:5000 -v /opt/data/registry:/var/lib/registry --name private_registry docker.io/registry
#-d : 让容器可以后台运行
#-p ：指定映射端口（前者是宿主机的端口号，后者是容器的端口号）
#-v ：数据挂载（前者是宿主机的目录，后者是容器的目录）
#--name : 为运行的容器命名

