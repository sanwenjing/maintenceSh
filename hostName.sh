echo "Input a new hostname:"
read name
hostnamectl set-hostname $name
hostname
