args=`getopt -o u:p:w:x:d:t:i:k:s: -al username:,password:,webport:,port:,domain:,dns_type:,dns_id:,dns_key:,dns_secret: -n 'seedbox.sh' -- "$@"`
eval set -- "$args"

while [ -n "$1" ]
do
  case "$1" in
    -u|--username) username=$2; shift 2;;
    -p|--password) password=$2; shift 2;;
    -w|--webport) webport=$2; shift 2;;
    -x|--port) port=$2; shift 2;;
    -d|--domain) domain=$2; shift 2;;
    -t|--dns_type) dns_type=$2; shift 2;;
    -i|--dns_id) dns_id=$2; shift 2;;
    -k|--dns_key) dns_key=$2; shift 2;;
    -s|--dns_secret) dns_secret=$2; shift 2;;
    --) shift ; break ;;
    *) echo "getopt error!"; break ;;
  esac
done

echo $username;
echo $password;
echo $webport;
echo $port;
echo $domain;
echo $dns_id;
echo $dns_key;
echo $dns_secret;