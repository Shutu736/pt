#! /bin/bash

domain=$1

# nginx
cd ~
curl  https://get.acme.sh | sh -s email=shutu736@gmail.com

export DP_Id="271440" && export DP_Key="6c86399fc719f021ff91f3690bc98588" && \
~/.acme.sh/acme.sh --issue  \
  --dns dns_dp  \
  -d $domain  \
  --server letsencrypt

mkdir /etc/nginx/ssl && ~/.acme.sh/acme.sh --install-cert -d $domain \
  --key-file       /etc/nginx/ssl/$domain.key  \
  --fullchain-file /etc/nginx/ssl/fullchain.cer  \
  --reloadcmd     "service nginx force-reload" 
