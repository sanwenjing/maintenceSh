FROM	repo.local.com/ubuntu:24.04
MAINTAINER SANWENJING <sanwenjing@163.com>
ENV TZ "Asia/Shanghai"
ENV PHOTOPRISM_SITE_URL "http://localhost:2342/"
EXPOSE 2342

RUN sed -i 's|http://archive.ubuntu.com|http://mirrors.aliyun.com|g' /etc/apt/sources.list.d/ubuntu.sources && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        tzdata ca-certificates imagemagick ffmpeg libjpeg-turbo-progs exiftool libgcc-s1 libstdc++6 python3 libvips-dev curl && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    mkdir -p /opt/photoprism /photoprism/originals /photoprism/storage /photoprism/import /photoprism/export /opt/photoprism/assets && \
    chmod -R 777 /photoprism && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY bin /opt/photoprism/bin
COPY lib /opt/photoprism/lib
COPY assets /opt/photoprism/assets
RUN chmod +x /opt/photoprism/bin/photoprism

WORKDIR /photoprism

ENTRYPOINT ["/opt/photoprism/bin/photoprism"]
CMD ["up"]
