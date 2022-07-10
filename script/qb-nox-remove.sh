#! /bin/sh
# Author:               Shutu
# Version:              1.0
# Mail:                 shutu736@gmail.com
# Date:                 2022-7-5

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

if [[ -f "/usr/bin/qb-nox-static-439-lt1215" ]]; then
  # 4.3.9
  echo -e "\033[36m ================= 删除qb-nox 4.3.9 ================= \033[0m"
  systemctl stop qb-nox-static-439-lt1215@$username
  rm -rf /etc/systemd/system/qb-nox-static-439-lt1215@.service
  rm -rf /usr/bin/qb-nox-static-439-lt1215
  systemctl disable qb-nox-static-439-lt1215@$username
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

if [[ -f "/usr/bin/qb-nox-static-419-lt1114-ax41" ]]; then
  # 4.1.9
  echo -e "\033[36m ================= 删除qb-nox 4.1.9 ================= \033[0m"
  systemctl stop qb-nox-static-419-lt1114-ax41@$username
  rm -rf /etc/systemd/system/qb-nox-static-419-lt1114-ax41@.service
  rm -rf /usr/bin/qb-nox-static-419-lt1114-ax41
  systemctl disable qb-nox-static-419-lt1114-ax41@$username
  rm -rf /home/$username/.config/qBittorrent/
  rm -rf /home/$username/.local/
  rm -rf /home/$username/.cache/qBittorrent/
fi

if [[ -f "/usr/bin/qb-nox-static-419-lt1114-ln" ]]; then
  # 4.1.9
  echo -e "\033[36m ================= 删除qb-nox 4.1.9 ================= \033[0m"
  systemctl stop qb-nox-static-419-lt1114-ln@$username
  rm -rf /etc/systemd/system/qb-nox-static-419-lt1114-ln@.service
  rm -rf /usr/bin/qb-nox-static-419-lt1114-ln
  systemctl disable qb-nox-static-419-lt1114-ln@$username
  rm -rf /home/$username/.config/qBittorrent/
  rm -rf /home/$username/.local/
  rm -rf /home/$username/.cache/qBittorrent/
fi

if [[ -f "/usr/bin/qb-nox-static-419-lt1114-12g" ]]; then
  # 4.1.9
  echo -e "\033[36m ================= 删除qb-nox 4.1.9 ================= \033[0m"
  systemctl stop qb-nox-static-419-lt1114-12g@$username
  rm -rf /etc/systemd/system/qb-nox-static-419-lt1114-12g@.service
  rm -rf /usr/bin/qb-nox-static-419-lt1114-12g
  systemctl disable qb-nox-static-419-lt1114-12g@$username
  rm -rf /home/$username/.config/qBittorrent/
  rm -rf /home/$username/.local/
  rm -rf /home/$username/.cache/qBittorrent/
fi

if [[ -f "/usr/bin/qb-nox-static-419-lt1114-oracle" ]]; then
  # 4.1.9
  echo -e "\033[36m ================= 删除qb-nox 4.1.9 ================= \033[0m"
  systemctl stop qb-nox-static-419-lt1114-oracle@$username
  rm -rf /etc/systemd/system/qb-nox-static-419-lt1114-oracle@.service
  rm -rf /usr/bin/qb-nox-static-419-lt1114-oracle
  systemctl disable qb-nox-static-419-lt1114-oracle@$username
  rm -rf /home/$username/.config/qBittorrent/
  rm -rf /home/$username/.local/
  rm -rf /home/$username/.cache/qBittorrent/
fi