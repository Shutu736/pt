#! /bin/bash
# Author:               Shutu
# Version:              1.0
# Mail:                 shutu736@gmail.com
# Date:                 2022-1-23
# Description:          参数处理脚本

args=`getopt -o u:p:d:t:i:k:s: -al username:,password:,domain:,dns_type:,dns_id:,dns_key:,dns_secret: -n 'seedbox.sh' -- "$@"`
eval set -- "$args"

while [ -n "$1" ]
do
  case "$1" in
    -u|--username) username=$2; shift 2;;
    -p|--password) password=$2; shift 2;;
    -d|--domain) domain=$2; shift 2;;
    -t|--dns_type) dns_type=$2; shift 2;;
    -i|--dns_id) dns_id=$2; shift 2;;
    -k|--dns_key) dns_key=$2; shift 2;;
    -s|--dns_secret) dns_secret=$2; shift 2;;
    --) shift ; break ;;
    *) echo "getopt error!"; break ;;
  esac
done