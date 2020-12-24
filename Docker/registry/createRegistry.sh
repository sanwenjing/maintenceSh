#building a registry server
docker run --restart=always -d \
    -v /opt/registry:/var/lib/registry \
    -p 5000:5000 \
    --name myregistry \
    registry:2 
