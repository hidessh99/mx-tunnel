#!/bin/bash
#Script By Mardhex
#telegram https://t.me/mardhex
# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"
export Server="raw.githubusercontent.com/kmardhex/rev/main/xcore"
#!/bin/bash
clear
echo -e "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;44;38m      INSTALLER - MENU            \E[0m"
echo -e "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo -e " [\e[36m•1\e[0m] Auto Pointing Domain "
echo -e " [\e[36m•2\e[0m] Add Domain Manual  "
echo -e ""
echo -e " [\e[36m•0\e[0m] \e[44mBACK TO EXIT/CANCEL\033[0m"
echo -e   ""
echo -e  "Press x or [ Ctrl+C ] • To-Exit"
echo -e ""
echo -e "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; wget https://${Server}/cf.sh ; bash cf.sh ;;
2) clear ; read -e -p " Masukan Domain : $domain" domain ; echo -e "$domain" > /root/domain ; echo -e "$domain" > /etc/v2ray/domain ;;
0) clear ; exit ;;
x) exit ;;
*) echo -e "" ; echo "Press any key to back on installation" ; sleep 1 ; ./install.sh ;;
esac

mkdir /var/lib/premium-script;
echo "IP=" >> /var/lib/premium-script/ipvps.conf
wget https://${Server}/cf.sh && chmod +x cf.sh && ./cf.sh
#install ssh ovpn
wget https://${Server}/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
wget https://${Server}/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh
#install ssr
wget https://${Server}/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
#install Sodosok
wget https://${Server}/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
#installwg
wget https://${Server}/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
#install v2ray
wget https://${Server}/ins-vt.sh && chmod +x ins-vt.sh && screen -S v2ray ./ins-vt.sh
#install L2TP
wget https://${Server}/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh
#Install Set-br
wget https://${Server}/set-br.sh && chmod +x set-br.sh && ./set-br.sh

rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ins-vt.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/cf.sh
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://mdxcloud.net

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://${Server}/set.sh"
chmod +x /etc/set.sh
history -c
echo "1.2" > /home/ver
clear
echo " "
echo "Auto Script Sukses Terinstal"
echo " "
echo "=================Auto Script By Kang Mardhex===============" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "--------------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442"  | tee -a log-install.txt
echo "   - Stunnel4                : 222, 777"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                : 444"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 8080"  | tee -a log-install.txt
echo "   - V2RAY Vless TLS         : 443"  | tee -a log-install.txt
echo "   - V2RAY Vless None TLS    : 80"  | tee -a log-install.txt
echo "   - Trojan                  : 2087"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Dev/Main                : KANG MARDHEX"  | tee -a log-install.txt
echo "   - Telegram                : t.me/mardhex"  | tee -a log-install.txt
echo "   - Instagram               : *"  | tee -a log-install.txt
echo "   - Whatsapp                : *"  | tee -a log-install.txt
echo "   - Facebook                : *" | tee -a log-install.txt
echo "------------------Ready Akun Ssh Premium Berkwalitas-----------------" | tee -a log-install.txt
echo ""
echo " Server Reboot 4 Detik"
sleep 4
rm -f setup.sh
reboot


