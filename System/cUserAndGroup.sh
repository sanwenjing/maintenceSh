echo "Create a user?(y/n)"
read key
if [ $key = 'y' ]; then

echo "Please input new user name."
read name
if [ $name ]; then
#useradd $name
useradd -d /home/$name -m $name
echo "Input a password for "$name
passwd $name
groupadd $name
usermod -G $name $name
fi
fi

