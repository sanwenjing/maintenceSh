FROM repo.local.com/ubuntu:24.04
MAINTAINER SANWENJING <sanwenjing@163.com>
ENV TZ "Asia/Shanghai"
EXPOSE 80 443 22 8000
ARG ROOT_PASSWORD=admin
ENV ROOT_PASSWORD=${ROOT_PASSWORD}
RUN apt-get update && apt-get install -y ca-certificates && mkdir -p /etc/apt/sources.list.d && \
    printf 'Types: deb\nURIs: https://mirrors.aliyun.com/ubuntu/\nSuites: noble noble-updates noble-backports noble-security\nComponents: main restricted universe multiverse\nSigned-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg\nEnabled: yes\n' > /etc/apt/sources.list.d/ubuntu.sources
RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd && \
    echo 'root:${ROOT_PASSWORD}' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    apt-get clean

RUN touch /np.start && \
echo "#!/bin/sh">>/np.start && \
echo "if [ -n \"$ROOT_PASSWORD\" ]; then">>/np.start && \
echo "  echo \"root:$ROOT_PASSWORD\" | chpasswd">>/np.start && \
echo "fi">>/np.start && \
echo "nohup /usr/sbin/crond>/dev/null 2>&1">>/np.start && \
echo "nohup /usr/sbin/sshd -D>/dev/null 2>&1">>/np.start && \
echo "tail -f /etc/hosts">>/np.start
ENTRYPOINT ["/bin/sh","/np.start"]
