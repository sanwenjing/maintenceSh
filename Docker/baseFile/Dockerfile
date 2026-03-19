FROM	repo.local.com/alpine:v3.23
MAINTAINER SANWENJING <sanwenjing@163.com>
ENV TZ "Asia/Shanghai"
EXPOSE 80 443

RUN sed -i "s/https:\/\/dl-cdn.alpinelinux.org/http:\/\/repo.local.com:8080/g" /etc/apk/repositories && \
    apk update && \
    apk add --no-cache tzdata nginx unzip && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    mkdir -p /var/www/localhost/htdocs /etc/nginx/http.d /opt/kityminder && \
    echo 'server { listen 80; server_name localhost; root /var/www/localhost/htdocs; index index.html; }' > /etc/nginx/http.d/default.conf

ADD KityMinder-v1.3.5.zip /opt/kityminder/KityMinder-v1.3.5.zip
RUN unzip -o /opt/kityminder/KityMinder-v1.3.5.zip -d /var/www/localhost/htdocs/ && \
    mv /var/www/localhost/htdocs/dist/* /var/www/localhost/htdocs/ && \
    rm -rf /var/www/localhost/htdocs/dist && \
    chmod -R 755 /var/www/localhost/htdocs

ENTRYPOINT ["/bin/sh","-c","[ -f /var/www/localhost/htdocs/index.html ] || (unzip -o /opt/kityminder/KityMinder-v1.3.5.zip -d /var/www/localhost/htdocs/ && mv /var/www/localhost/htdocs/dist/* /var/www/localhost/htdocs/ && rm -rf /var/www/localhost/htdocs/dist); /usr/sbin/nginx && tail -f /etc/hosts"]
