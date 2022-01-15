FROM	repo.local.com/alpine:3.9.0
#FROM	docker.io/gliderlabs/alpine
MAINTAINER SANWENJING <sanwenjing@163.com>
ENV TZ "Asia/Shanghai"
EXPOSE 22
ENV DATA_DIR=/data
ENV ROOT_PASSWORD=admin
#modify the repo for apk
RUN sed -i "s/alpine.gliderlabs.com/repo.local.com:8080/g" /etc/apk/repositories

RUN apk update && \
apk add --no-cache tzdata openssh git && \ 
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo "Asia/Shanghai"> /etc/timezone && \
sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config && \
    ssh-keygen -t dsa -P "" -f /etc/ssh/ssh_host_dsa_key && \
    ssh-keygen -t rsa -P "" -f /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -t ecdsa -P "" -f /etc/ssh/ssh_host_ecdsa_key && \
    ssh-keygen -t ed25519 -P "" -f /etc/ssh/ssh_host_ed25519_key && \
    echo "root:$ROOT_PASSWORD" | chpasswd 

RUN mkdir $DATA_DIR -p 

VOLUME $DATA_DIR

#ADD config.json /root/.homebridge/

RUN touch /np.start && \
echo "#!/bin/sh">>/np.start && \
echo "nohup /usr/sbin/crond>/dev/null 2>&1">>/np.start && \
echo "nohup /usr/sbin/sshd -D>/dev/null 2>&1">>/np.start && \
echo "tail -f /etc/hosts">>/np.start
ENTRYPOINT /bin/sh /np.start
