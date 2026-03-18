FROM repo.local.com/alpine:v3.23
MAINTAINER SANWENJING <sanwenjing@163.com>
ENV TZ Asia/Shanghai
EXPOSE 22000 21025/udp

RUN sed -i "s/https:\/\/dl-cdn.alpinelinux.org/http:\/\/repo.local.com:8080/g" /etc/apk/repositories && \
    apk update && \
    apk add --no-cache tzdata bash && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

COPY stdiscosrv-linux-amd64-v2.0.16-rc.2.tar.gz /tmp/
RUN tar -xzf /tmp/stdiscosrv-linux-amd64-v2.0.16-rc.2.tar.gz -C /tmp && \
    mv /tmp/stdiscosrv-linux-amd64-v2.0.16-rc.2/stdiscosrv /usr/local/bin/ && \
    rm -rf /tmp/stdiscosrv* && \
    chmod +x /usr/local/bin/stdiscosrv

CMD ["/usr/local/bin/stdiscosrv"]
