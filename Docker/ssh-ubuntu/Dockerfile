FROM repo.local.com/ubuntu:24.04

RUN sed -i 's/http:\/\/archive.ubuntu.com/https:\/\/mirrors.aliyun.com/' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd && \
    echo 'root:admin' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    apt-get clean

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]