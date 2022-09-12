#!/bin/bash
#Script By Mardhex
#telegram https://t.me/mardhex
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
versi=$(cat /home/ver)
if [[ $versi == 1.2 ]]; then
echo "You Have The Latest Version"
exit 0
fi
echo "Start Update"
cd /usr/bin
wget -O menu "https://${Server}/menu.sh"
wget -O usernew "https://${Server}/usernew.sh"
wget -O trial "https://${Server}/trial.sh"
wget -O change-port "https://${Server}/change.sh"
wget -O port-ovpn "https://${Server}/port-ovpn.sh"
wget -O port-ssl "https://${Server}/port-ssl.sh"
wget -O port-wg "https://${Server}/port-wg.sh"
wget -O port-tr "https://${Server}/port-tr.sh"
wget -O port-sstp "https://${Server}/port-sstp.sh"
wget -O port-squid "https://${Server}/port-squid.sh"
wget -O port-ws "https://${Server}/port-ws.sh"
wget -O port-vless "https://${Server}/port-vless.sh"
wget -O wbmn "https://${Server}/webmin.sh"
wget -O xp "https://${Server}/xp.sh"
wget -O limit-speed "https://${Server}/limit-speed.sh"
wget -O add-sstp "https://${Server}/add-sstp.sh"
wget -O add-ws "https://${Server}/add-ws.sh"
wget -O add-vless "https://${Server}/add-vless.sh"
wget -O add-tr "https://${Server}/add-tr.sh"
chmod +x change-port
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-wg
chmod +x port-sstp
chmod +x port-tr
chmod +x port-squid
chmod +x port-ws
chmod +x port-vless
chmod +x wbmn
chmod +x xp
chmod +x limit-speed
echo "0 5 * * * root clear-log && reboot" > /etc/crontab
echo "0 0 * * * root xp" > /etc/crontab
cd
echo "1.2" > /home/ver
clear
echo " Fix minor Bugs"
echo " Now You Can Change Port Of Some Services"
echo " Reboot 5 Sec"
sleep 5
rm -f update.sh
reboot
