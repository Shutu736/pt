#! /bin/bash
# Author:               Shutu
# Version:              1.0
# Mail:                 shutu736@gmail.com
# Date:                 2022-2-11
# Description:          饭盒qb一键脚本

# options
args=`getopt -o u:p:w:x: -al username:,password:,webport:,port: -n 'shared-seedbox.sh' -- "$@"`
eval set -- "$args"

while [ -n "$1" ]
do
  case "$1" in
    -u|--username) username=$2; shift 2;;
    -p|--password) password=$2; shift 2;;
    -w|--webport) webport=$2; shift 2;;
    -x|--port) port=$2; shift 2;;
    --) shift ; break ;;
    *) echo "getopt error!"; break ;;
  esac
done

mkdir -p ~/bin
mkdir -p ~/private/qBittorrent/data
wget https://github.com/Shutu736/pt/raw/master/qb-nox/qb-nox-static-419-lt1114-fh
mv qb-nox-static-419-lt1114-fh qbittorrent-nox
mv qbittorrent-nox ~/bin/
chmod +x ~/bin/qbittorrent-nox

mkdir -p ~/.config/qBittorrent
md5password=$(echo -n $password | md5sum | awk '{print $1}')
  cat << EOF >~/.config/qBittorrent/qBittorrent.conf
[LegalNotice]
Accepted=true
[Network]
Cookies=@Invalid()
[Preferences]
Connection\PortRangeMin=$port
General\Locale=zh
General\UseRandomPort=false
Downloads\SavePath=private/qBittorrent/data
Queueing\QueueingEnabled=false
WebUI\Password_ha1=@ByteArray($md5password)
WebUI\Port=$webport
WebUI\Username=$username
WebUI\CSRFProtection=false
EOF
screen -dmS qBittorrent ~/bin/qbittorrent-nox
pgrep -fu "$(whoami)" "qbittorrent-nox"
echo "当前域名登录地址 http://$(whoami).$(hostname -f):$(sed -rn 's|WebUI\\Port=||p' ~/.config/qBittorrent/qBittorrent.conf)"
echo "账号: ${username} 密码: ${password}"