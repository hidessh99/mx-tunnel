#!/bin/bash
#Script By Mardhex
#telegram https://t.me/mardhex
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/v2ray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/v2ray/config.json
cat>/etc/v2ray/$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/MDXCloud",
      "type": "none",
      "host": "",
      "tls": "tls"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmesslink1="vmess://$(base64 -w 0 /etc/v2ray/$user-tls.json)"
systemctl restart v2ray
systemctl restart v2ray@none
service cron restart
clear
echo -e ""
echo -e "==========-V2RAY/VMESS-=========="
echo -e "Remarks        : ${user}"
echo -e "CITY           : $CITY"
echo -e "ISP            : $ISP"
echo -e "Domain         : ${domain}"
echo -e "port TLS       : ${tls}"
echo -e "id             : ${uuid}"
echo -e "alterId        : 0"
echo -e "Security       : auto"
echo -e "network        : ws"
echo -e "path           : /MDXCloud"
echo -e "================================="
echo -e "link TLS       : ${vmesslink1}"
echo -e "================================="
echo -e "Expired On     : $exp"
echo -e "AutoScript By Mardhex"
