#! /bin/sh
# Author:               Shutu
# Version:              1.0
# Mail:                 shutu736@gmail.com
# Date:                 2022-1-22
# Description:          栗山未来大佬原创

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
if [ $username ]; then
  mkdir -p /home/$username/.config/qBittorrent && chmod -R 777 /home/$username/.config/qBittorrent
   mkdir -p /home/$username/.config/qBittorrent/rss && chmod -R 777 /home/$username/.config/qBittorrent/rss
  touch /home/$username/.config/qBittorrent/qBittorrent.conf
  if [[ "${version}" =~ "4.1." ]]; then
    md5password=$(echo -n $password | md5sum | awk '{print $1}')
        cat << EOF >$HOME/.config/qBittorrent/qBittorrent.conf
[LegalNotice]
[AutoRun]
enabled=false
program=

[BitTorrent]
Session\Categories=@Variant(\0\0\0\b\0\0\0\x3\0\0\0\xe\0o\0u\0r\0\x62\0i\0t\0s\0\0\0\n\0\0\0\0\0\0\0\n\0h\0\x64\0s\0k\0y\0\0\0\n\0\0\0\0\0\0\0\n\0h\0\x61\0r\0\x65\0s\0\0\0\n\0\0\0\0)
Session\CreateTorrentSubfolder=true
Session\DisableAutoTMMByDefault=true
Session\DisableAutoTMMTriggers\CategoryChanged=false
Session\DisableAutoTMMTriggers\CategorySavePathChanged=true
Session\DisableAutoTMMTriggers\DefaultSavePathChanged=true

[Core]
AutoDeleteAddedTorrentFile=Never

[Network]
Cookies=@Invalid()

[Preferences]
Bittorrent\AddTrackers=false
Bittorrent\MaxRatioAction=0
Bittorrent\PeX=false
Connection\GlobalDLLimitAlt=10
Connection\GlobalUPLimitAlt=10
Connection\PortRangeMin=28888
Downloads\PreAllocation=false
Downloads\ScanDirsV2=@Variant(\0\0\0\x1c\0\0\0\0)
Downloads\StartInPause=false
DynDNS\DomainName=changeme.dyndns.org
DynDNS\Enabled=false
DynDNS\Password=
DynDNS\Service=0
DynDNS\Username=
General\Locale=zh
General\UseRandomPort=false
MailNotification\email=
MailNotification\enabled=false
MailNotification\password=$password
MailNotification\req_auth=true
MailNotification\req_ssl=false
MailNotification\sender=qBittorrent_notification@example.com
MailNotification\smtp_server=smtp.changeme.com
MailNotification\username=$username
WebUI\Address=*
WebUI\AlternativeUIEnabled=false
WebUI\AuthSubnetWhitelist=@Invalid()
WebUI\AuthSubnetWhitelistEnabled=false
WebUI\CSRFProtection=false
WebUI\ClickjackingProtection=false
WebUI\HTTPS\Enabled=false
WebUI\HostHeaderValidation=false
WebUI\LocalHostAuth=true
WebUI\Password_ha1=@ByteArray($md5password)
WebUI\Port=8080
WebUI\RootFolder=
WebUI\ServerDomains=*
WebUI\UseUPnP=true
WebUI\Username=$username
EOF
  fi
fi
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
echo -e "start command: \033[35msystemctl start ${versions[$num]}@username\033[0m"
echo -e "stop command: \033[35msystemctl stop ${versions[$num]}@username\033[0m"
echo -e "restart command: \033[35msystemctl restart ${versions[$num]}@username\033[0m"
echo -e "set start at boot: \033[35msystemctl enable ${versions[$num]}@username\033[0m"
echo -e "unset start at boot: \033[35msystemctl disable ${versions[$num]}@username\033[0m"
