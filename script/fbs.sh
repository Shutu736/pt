#! /bin/bash
# Author:               Shutu
# Version:              1.0
# Mail:                 shutu736@gmail.com
# Date:                 2022-2-6
# Description:          FBE 荒野无灯一键安装

curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
mkdir -p ~/docker/fb/config ~/docker/fb/myfiles
docker run -d --name fb \
  --restart=unless-stopped \
  -e PUID=$UID \
  -e PGID=$GID \
  -e WEB_PORT=8082 \
  -e FB_AUTH_SERVER_ADDR="127.0.0.1" \
  -p 8082:8082 \
  -v ~/docker/fb/config:/config \
  -v /:/myfiles \
  --mount type=tmpfs,destination=/tmp \
  80x86/filebrowser:2.9.4-amd64