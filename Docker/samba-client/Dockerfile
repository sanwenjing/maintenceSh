FROM repo.local.com/alpine:v3.23

LABEL maintainer="sanwenjing@163.com"

ENV TZ="Asia/Shanghai"
ENV SMB_HOST="192.168.31.2"
ENV SMB_USERNAME=""
ENV SMB_PASSWORD=""
ENV SHARE_PATH="disk2"

RUN sed -i "s|https://dl-cdn.alpinelinux.org|http://repo.local.com:8080|g" /etc/apk/repositories && \
    apk update && \
    apk add --no-cache \
        tzdata \
        cifs-utils \
        mount && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /mnt/samba

COPY mount-samba.sh /usr/local/bin/mount-samba.sh
RUN chmod +x /usr/local/bin/mount-samba.sh

ENTRYPOINT ["/usr/local/bin/mount-samba.sh"]
CMD ["tail", "-f", "/dev/null"]