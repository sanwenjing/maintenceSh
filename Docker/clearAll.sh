docker images
echo "Remove all images?(y/n)"
read key
if [$key='y']; then
docker images|awk '{print $1}'|xargs docker rmi -f
fi

docker ps -a
echo "Remove all container?(y/n)"
read key
if [$key='y']; then
docker ps -a | awk '{print $1}' | xargs docker rm
fi
