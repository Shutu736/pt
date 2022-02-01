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
