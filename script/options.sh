#! /bin/bash
# Author:               Shutu
# Version:              1.0
# Mail:                 shutu736@gmail.com
# Date:                 2022-1-23
# Description:          参数处理脚本

args=`getopt -o u:p:d:t:i:k: -al username:,password:,domain:,type:,id:,key: -n 'seedbox.sh' -- "$@"`
eval set -- "$args"

while [ -n "$1" ]
do
  case "$1" in
    -u|--username) username=$2; shift 2;;
    -p|--password) password=$2; shift 2;;
    -d|--domain) domain=$2; shift 2;;
    -t|--type) dns_type=$2; shift 2;;
    -i|--id) dns_id=$2; shift 2;;
    -k|--key) dns_key=$2; shift 2;;
    --) shift ; break ;;
    *) echo "getopt error!"; break ;;
  esac
done