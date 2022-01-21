#! /bin/bash

username=$1
password=$2
domain=$3
echo -e "\033[32m ============================= \033[0m"
echo -e "\033[32m ========== 创建用户 ========== \033[0m"
echo -e "\033[32m ============================= \033[0m"
pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
echo -e "\033[35m 用户名: $username \033[0m"
echo -e "\033[35m 密码: $password \033[0m"
# create user
groupadd $username && useradd -m $username -p $pass -g $username -s /bin/bash -d /home/$username
mkdir /home/$username/Downloads && chmod -R 777 /home/$username/Downloads
echo -e "\033[32m ================================ \033[0m"
echo -e "\033[32m ========== 创建用户成功 ========== \033[0m"
echo -e "\033[32m ================================ \033[0m"

echo -e "\033[32m ===================================== \033[0m"
echo -e "\033[32m ========== 安装依赖并设置时区 ========== \033[0m"
echo -e "\033[32m ===================================== \033[0m"
# apt
apt-get update && apt-get install vim nano sysstat vnstat nginx -y

# set timezone
timedatectl set-timezone Asia/Shanghai
echo -e "\033[32m ========================================= \033[0m"
echo -e "\033[32m ========== 安装依赖并设置时区成功 ========== \033[0m"
echo -e "\033[32m ========================================= \033[0m"

# qb install
echo -e "\033[32m ================================ \033[0m"
echo -e "\033[32m ========== qb-nox安装 ========== \033[0m"
echo -e "\033[32m ================================ \033[0m"
source <(wget -qO- https://raw.githubusercontent.com/Shutu736/pt/master/script/qb-nox-static.sh)
# source ./qb-nox-static.sh

# qb systemctl
echo $qb_version
systemctl start $qb_version@$username
systemctl enable $qb_version@$username
echo -e "\033[32m =================================== \033[0m"
echo -e "\033[32m ========== qb-nox安装成功 ========== \033[0m"
echo -e "\033[32m =================================== \033[0m"

echo -e "\033[32m ================================ \033[0m"
echo -e "\033[32m ========== 域名申请配置 ========== \033[0m"
echo -e "\033[32m ================================ \033[0m"
# acme
cd ~ && curl  https://get.acme.sh | sh -s email=shutu736@gmail.com

export DP_Id="271440" && export DP_Key="6c86399fc719f021ff91f3690bc98588" && \
~/.acme.sh/acme.sh --issue  \
  --dns dns_dp  \
  -d $domain  \
  --server letsencrypt

mkdir /etc/nginx/ssl && ~/.acme.sh/acme.sh --install-cert -d $domain \
  --key-file       /etc/nginx/ssl/$domain.key  \
  --fullchain-file /etc/nginx/ssl/fullchain.cer  \
  --reloadcmd     "service nginx force-reload" 

# nginx
echo "server {  
    listen  80;
    server_name $domain;
      
    rewrite ^(.*)$  https://$host$1 permanent; 
}

server {
    listen 443 ssl;
    server_name docs.lvrui.io;

    index index.html index.htm;

    ssl_certificate /etc/nginx/ssl/fullchain.cer;
    ssl_certificate_key /etc/nginx/ssl/$domain.key;
    ssl_session_timeout 5m;
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2; # TLS
    ssl_session_cache builtin:1000 shared:SSL:10m;

    error_page 404 /404.html;
    location / {
        proxy_pass http://127.0.0.1:8080/;
        proxy_set_header Host $http_host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}" > /etc/nginx/conf.d/$domain.conf
nginx -s reload
echo -e "\033[32m ================================ \033[0m"
echo -e "\033[32m ========== 域名申请成功 ========== \033[0m"
echo -e "\033[32m ================================ \033[0m"
