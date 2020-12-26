docker ps -a
echo "Stop all container?(y/n)"
read key
if [ $key = 'y' ]; then
docker ps -a | awk '{print $1}' | xargs docker stop
fi
