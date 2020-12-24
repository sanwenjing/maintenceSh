echo "Are your want to delete a user?(y/n)"
read key
if [ $key = 'y' ]; then

echo "Please input the user name your want to remove."
read name
if [ $name ]; then
#Lock the user
usermod -L $name
#ps -ef|grep $name|awk '$1=="'$name'"{print $2}'|kill
userdel -r $name
fi
fi

