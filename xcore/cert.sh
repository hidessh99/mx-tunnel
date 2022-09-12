#!/bin/bash
#Script By Mardhex
#telegram https://t.me/mardhex
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Checking VPS"
clear
echo start
sleep 0.5
source /var/lib/premium-script/ipvps.conf
domain="$(cat /etc/v2ray/domain)"
sudo lsof -t -i tcp:80 -s tcp:listen | sudo xargs kill

systemctl stop nginx
mkdir /root/.acme.sh
curl https://acme-install.netlify.app/acme.sh -o /root/.acme.sh/acme.sh
chmod +x /root/.acme.sh/acme.sh
/root/.acme.sh/acme.sh --upgrade --auto-upgrade
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/v2ray/v2ray.crt --keypath /etc/v2ray/v2ray.key --ecc

/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/stunnel4 restart
/etc/init.d/openvpn restart
/etc/init.d/fail2ban restart
/etc/init.d/cron restart
/etc/init.d/nginx restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000
systemctl restart v2ray@none
systemctl restart v2ray
systemctl restart trojan
systemctl restart v2ray@vless
systemctl restart v2ray@vnone
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "          Service/s Restarted         "
                echo -e ""
                echo -e "======================================"
                exit
clear 
neofetch
