#! /bin/bash

username=$1
password=$2
pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
echo $username
echo $password
echo $pass
# create user
groupadd $username && useradd -m $username -p $pass -g $username -s /bin/bash -d /home/$username
mkdir /home/$username/Downloads && chmod -R 777 /home/$username/Downloads

# apt
apt-get update && apt-get install vim nano sysstat vnstat nginx -y

# set timezone
timedatectl set-timezone Asia/Shanghai

# qb install
source <(wget -qO- https://raw.githubusercontent.com/Shutu736/pt/master/script/qb-nox-static.sh)

# qb systemctl
echo qb_version