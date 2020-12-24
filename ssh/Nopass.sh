echo "Create a keygen now?(y/n)"
read iskey
if [ $iskey = 'y' ]; then
echo "Please give a name for new key.Ex.abc@where"
read name

if [ $name ]; then 
ssh-keygen -t rsa -C $name
fi

fi
echo "Please input ssh-copy-id -i ~/.ssh/id_rsa.pub 'proxy@ip -p port'"
echo "End"
