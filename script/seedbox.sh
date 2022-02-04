#! /bin/bash
# Author:               Shutu
# Version:              1.0
# Mail:                 shutu736@gmail.com
# Date:                 2022-1-23
# Description:          Debian11 专用一键脚本

# options
args=`getopt -al username:,password:,webport:,port:,domain:,dns_type:,dns_id:,dns_key:,dns_secret: -n 'seedbox.sh' -- "$@"`
eval set -- "$args"

while [ -n "$1" ]
do
  case "$1" in
    --username) username=$2; shift 2;;
    --password) password=$2; shift 2;;
    --domain) domain=$2; shift 2;;
    --webport) webport=$2; shift 2;;
    --port) port=$2; shift 2;;
    --dns_type) dns_type=$2; shift 2;;
    --dns_id) dns_id=$2; shift 2;;
    --dns_key) dns_key=$2; shift 2;;
    --dns_secret) dns_secret=$2; shift 2;;
    --) shift ; break ;;
    *) echo "getopt error!"; break ;;
  esac
done

if [ ! $webport ]; then
  $webport=8080
fi
if [ ! $port ]; then
  $webport=28888
fi

# create user
if [[ ! -d "/home/$username" ]]; then
  echo -e "\033[36m ================= 创建用户 ================= \033[0m"
  pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
  
  # create user
  groupadd $username && useradd -m $username -p $pass -g $username -s /bin/bash -d /home/$username
fi

# apt install
echo -e "\033[36m ================= 安装依赖并设置时区 ================= \033[0m"
# apt
apt-get update && apt-get install vim nano sysstat vnstat -y
# set timezone
timedatectl set-timezone Asia/Shanghai

# qb install
echo -e "\033[36m ================= qb-nox安装 ================= \033[0m"
source <(wget -qO- https://raw.githubusercontent.com/Shutu736/pt/master/script/qb-nox-static.sh)

# qb systemctl
echo $qb_version

# acme nginx
# 判断是否需要域名申请
if [ $dns_type ]; then
  echo -e "\033[36m ================= 域名申请配置 ================= \033[0m"
  # nginx
  apt-get install nginx -y
  # acme
  cd ~ && curl https://get.acme.sh | sh -s email=shutu736@gmail.com
  if [ "$dns_type" == "dns_dp" ]; then
    export DP_Id=$dns_id && export DP_Key=$dns_key &&
    ~/.acme.sh/acme.sh --issue \
      --dns dns_dp \
      -d $domain \
      --server letsencrypt
  else
    export Ali_Key=$dns_key && export Ali_Secret=$dns_secret &&
    ~/.acme.sh/acme.sh --issue \
      --dns dns_ali \
      -d $domain \
      --server letsencrypt
  fi

  mkdir /etc/nginx/ssl && ~/.acme.sh/acme.sh --install-cert -d $domain \
    --key-file /etc/nginx/ssl/$domain.key \
    --fullchain-file /etc/nginx/ssl/fullchain.cer \
    --reloadcmd "service nginx force-reload"

  # nginx
  echo 'server {  
      listen  80;
      server_name domain.com;
        
      rewrite ^(.*)$  https://$host$1 permanent; 
  }
  server {
      listen 443 ssl;
      server_name domain.com;
      index index.html index.htm;
      ssl_certificate /etc/nginx/ssl/fullchain.cer;
      ssl_certificate_key /etc/nginx/ssl/domain.com.key;
      ssl_session_timeout 5m;
      ssl_protocols TLSv1 TLSv1.1 TLSv1.2; # TLS
      ssl_session_cache builtin:1000 shared:SSL:10m;
      error_page 404 /404.html;
      location / {
          proxy_pass http://127.0.0.1:webport/;
          proxy_set_header Host $http_host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      }
  }' >/etc/nginx/conf.d/$domain.conf
  # conf中的$domain替换为域名
  sed -i "s/domain.com/${domain}/g" /etc/nginx/conf.d/$domain.conf
  sed -i "s/webport/${webport}/g" /etc/nginx/conf.d/$domain.conf

  nginx -s reload
fi

echo -e "\033[36m ================= 安装成功 ================= \033[0m"
if [ $domain ]; then
  echo -e "\033[35m 网址: https://$domain/ \033[0m"
fi
echo -e "\033[35m 用户名: $username \033[0m"
echo -e "\033[35m 密码: $password \033[0m"
echo -e "\033[36m =========================================== \033[0m"