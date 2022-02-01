#! /bin/sh
# Author:               Shutu
# Version:              1.0
# Mail:                 shutu736@gmail.com
# Date:                 2022-1-22
# Description:          栗山未来大佬原创

username=$1
password=$2

versions[0]=qb-nox-static-419-lt1114
versions[1]=qb-nox-static-419-lt1114-nvme
versions[2]=qb-nox-static-438-lt1214
j=3

for ((i = 0; i < j; i++)); do
  echo -e "\033[35m ${i}) ${versions[$i]}\033[0m"
done
echo -n 'select version: '
read num
echo -ne "install \033[35m${versions[$num]}\033[0m , press Ctrl + C to exit."
read

wget -O "/usr/bin/${versions[$num]}" "https://github.com/Shutu736/pt/raw/master/qb-nox/${versions[$num]}" && chmod +x "/usr/bin/${versions[$num]}"
qb_version=${versions[$num]}
echo "[Unit]
Description=${versions[$num]}
After=network.target
[Service]
User=%I
Type=simple
RemainAfterExit=yes
LimitNOFILE=100000
ExecStart=/usr/bin/${versions[$num]}
[Install]
WantedBy=multi-user.target" >/etc/systemd/system/${versions[$num]}@.service

mkdir -p /home/$username/Downloads && chown $username /home/$username/Downloads
mkdir -p /home/$username/.config/qBittorrent && chown $username /home/$username/.config/qBittorrent

systemctl start ${versions[$num]}@$username
systemctl enable ${versions[$num]}@$username

systemctl stop ${versions[$num]}@$username

md5password=$(echo -n $password | md5sum | awk '{print $1}')
cat << EOF >/home/$username/.config/qBittorrent/qBittorrent.conf
[LegalNotice]
Accepted=true

[Network]
Cookies=@Invalid()

[Preferences]
Connection\PortRangeMin=45000
Downloads\DiskWriteCacheSize=$Cache2
Downloads\SavePath=/home/$username/qbittorrent/Downloads/
Queueing\QueueingEnabled=false
WebUI\Password_ha1=@ByteArray($md5password)
WebUI\Port=8080
WebUI\Username=$username
EOF

systemctl start ${versions[$num]}@$username

# echo -e "start command: \033[35msystemctl start ${versions[$num]}@username\033[0m"
# echo -e "stop command: \033[35msystemctl stop ${versions[$num]}@username\033[0m"
# echo -e "restart command: \033[35msystemctl restart ${versions[$num]}@username\033[0m"
# echo -e "set start at boot: \033[35msystemctl enable ${versions[$num]}@username\033[0m"
# echo -e "unset start at boot: \033[35msystemctl disable ${versions[$num]}@username\033[0m"