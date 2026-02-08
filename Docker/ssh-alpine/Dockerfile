FROM	repo.local.com/alpine:v3.23
#FROM	docker.io/gliderlabs/alpine
MAINTAINER SANWENJING <sanwenjing@163.com>
ENV TZ "Asia/Shanghai"
EXPOSE 80 443 9000 22

ARG ROOT_PASSWORD=admin
ENV ROOT_PASSWORD=${ROOT_PASSWORD}

#modify the repo for apk
#RUN sed -i "s/https:\/\/alpine.gliderlabs.com/https:\/\/mirrors.aliyun.com/g" /etc/apk/repositories
RUN sed -i "s/https:\/\/dl-cdn.alpinelinux.org/http:\/\/repo.local.com:8080/g" /etc/apk/repositories

RUN apk update && \
apk add --no-cache openssh \
tzdata  && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 

RUN ssh-keygen -A && \
echo "root:${ROOT_PASSWORD}" | chpasswd && \
sed -i 's/#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
sed -i 's/#PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
sed -i 's/PermitRootLogin.*without-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
sed -i 's/#StrictModes.*/StrictModes no/' /etc/ssh/sshd_config

RUN mkdir -p /run/openrc && \
touch /run/openrc/softlevel

RUN touch /np.start && \
echo "#!/bin/sh">>/np.start && \
echo "if [ -n \"\$ROOT_PASSWORD\" ]; then">>/np.start && \
echo "  echo \"root:\$ROOT_PASSWORD\" | chpasswd">>/np.start && \
echo "  echo \"Password set successfully\" >>/np.start">>/np.start && \
echo "fi">>/np.start && \
echo "nohup /usr/sbin/crond>/dev/null 2>&1">>/np.start && \
echo "nohup /usr/sbin/sshd>/dev/null 2>&1">>/np.start && \
echo "tail -f /etc/hosts">>/np.start
#ADD start.sh /root/
#RUN chmod +x /root/start.sh
ENTRYPOINT ["/bin/sh","/np.start"]
