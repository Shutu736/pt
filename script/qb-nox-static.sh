#! /bin/sh
# Author:               Shutu
# Version:              1.0
# Mail:                 shutu736@gmail.com
# Date:                 2022-1-22
# Description:          栗山未来大佬原创

if [ ! $username ]; then
  username=$1
  password=$2
fi

versions[0]=qb-nox-static-419-lt1114
versions[1]=qb-nox-static-438-lt1214
j=2

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

if [[ "${versions[$num]}" =~ "qb-nox-static-419-lt1114" ]]; then
  

  md5password=$(echo -n $password | md5sum | awk '{print $1}')
  cat << EOF >/home/$username/.config/qBittorrent/qBittorrent.conf
[LegalNotice]
Accepted=true
[Network]
Cookies=@Invalid()
[Preferences]
Connection\PortRangeMin=28888
General\Locale=zh
General\UseRandomPort=false
Downloads\SavePath=/home/$username/Downloads/
Queueing\QueueingEnabled=false
WebUI\Password_ha1=@ByteArray($md5password)
WebUI\Port=8080
WebUI\Username=$username
WebUI\CSRFProtection=false
EOF
else
  /home/$username && wget https://raw.githubusercontent.com/jerry048/Seedbox-Components/main/Torrent%20Clients/qBittorrent/qb_password_gen && chmod +x /home/$username/qb_password_gen
  PBKDF2password=$(/home/$username/qb_password_gen $password)
  cat << EOF >/home/$username/.config/qBittorrent/qBittorrent.conf
[LegalNotice]
Accepted=true
[Network]
Cookies=@Invalid()
[Preferences]
Connection\PortRangeMin=28888
General\Locale=zh
General\UseRandomPort=false
Downloads\SavePath=/home/$username/Downloads/
Queueing\QueueingEnabled=false
WebUI\Password_PBKDF2="@ByteArray($PBKDF2password)"
WebUI\Port=8080
WebUI\Username=$username
WebUI\CSRFProtection=false
EOF
  rm /home/$username/qb_password_gen
fi
systemctl start ${versions[$num]}@$username