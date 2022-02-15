#! /bin/sh
# Author:               Shutu
# Version:              1.0
# Mail:                 shutu736@gmail.com
# Date:                 2022-1-22
# Description:          栗山未来大佬原创

username=$1

#判断文件是否存在
if [[ -f "/usr/bin/qb-nox-static-438-lt1214" ]]; then
  # 4.3.8
  echo -e "\033[36m ================= 删除qb-nox 4.3.8 ================= \033[0m"
  systemctl stop qb-nox-static-438-lt1214@$username
  rm -rf /etc/systemd/system/qb-nox-static-438-lt1214@.service
  rm -rf /usr/bin/qb-nox-static-438-lt1214
  systemctl disable qb-nox-static-438-lt1214@$username
  rm -rf /home/$username/.config/qBittorrent/
  rm -rf /home/$username/.local/share/
  rm -rf /home/$username/.cache/qBittorrent/
fi

if [[ -f "/usr/bin/qb-nox-static-419-lt1114" ]]; then
  # 4.1.9
  echo -e "\033[36m ================= 删除qb-nox 4.1.9 ================= \033[0m"
  systemctl stop qb-nox-static-419-lt1114@$username
  rm -rf /etc/systemd/system/qb-nox-static-419-lt1114@.service
  rm -rf /usr/bin/qb-nox-static-419-lt1114
  systemctl disable qb-nox-static-419-lt1114@$username
  rm -rf /home/$username/.config/qBittorrent/
  rm -rf /home/$username/.local/
  rm -rf /home/$username/.cache/qBittorrent/
fi

if [[ -f "/usr/bin/qb-nox-static-419-lt1114-hdd" ]]; then
  # 4.1.9
  echo -e "\033[36m ================= 删除qb-nox 4.1.9 ================= \033[0m"
  systemctl stop qb-nox-static-419-lt1114-hdd@$username
  rm -rf /etc/systemd/system/qb-nox-static-419-lt1114-hdd@.service
  rm -rf /usr/bin/qb-nox-static-419-lt1114-hdd
  systemctl disable qb-nox-static-419-lt1114-hdd@$username
  rm -rf /home/$username/.config/qBittorrent/
  rm -rf /home/$username/.local/
  rm -rf /home/$username/.cache/qBittorrent/
fi

if [[ -f "/usr/bin/qb-nox-static-419-lt1114-latest" ]]; then
  # 4.1.9
  echo -e "\033[36m ================= 删除qb-nox 4.1.9 ================= \033[0m"
  systemctl stop qb-nox-static-419-lt1114-latest@$username
  rm -rf /etc/systemd/system/qb-nox-static-419-lt1114-latest@.service
  rm -rf /usr/bin/qb-nox-static-419-lt1114-latest
  systemctl disable qb-nox-static-419-lt1114-latest@$username
  rm -rf /home/$username/.config/qBittorrent/
  rm -rf /home/$username/.local/
  rm -rf /home/$username/.cache/qBittorrent/
fi