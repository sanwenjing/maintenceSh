FROM repo.local.com/alpine:v3.23
ENV TZ "Asia/Shanghai"

RUN sed -i "s/https:\/\/dl-cdn.alpinelinux.org/http:\/\/repo.local.com:8080/g" /etc/apk/repositories && \
    apk update && \
    apk add --no-cache tzdata python3 py3-pip && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

WORKDIR /app

COPY FileCodeBox-2.3.tar.gz /app/
RUN tar -xzf FileCodeBox-2.3.tar.gz && \
    mv FileCodeBox-2.3/* . && \
    rm -rf FileCodeBox-2.3 FileCodeBox-2.3.tar.gz && \
    pip3 install --no-cache-dir -r requirements.txt --break-system-packages

EXPOSE 12345

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:12345/ || exit 1

CMD ["python3", "main.py"]