#!/bin/bash
#Script By Mardhex
#telegram https://t.me/mardhex

clear

if [[ -e /etc/debian_version ]]; then
	OS=debian
	RCLOCAL='/etc/rc.local'
elif [[ -e /etc/centos-release || -e /etc/redhat-release ]]; then
	OS=centos
	RCLOCAL='/etc/rc.d/rc.local'
	chmod +x /etc/rc.d/rc.local
else
	echo "It looks like you are not running this installer on Debian, Ubuntu or Centos system"
	exit
fi
color3='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipv4.icanhazip.com )
	echo "--------------- Welcome To Premium Script Menu ---------------"
	echo "------------------------ Moddified By Mardhex -----------------------"
	echo " "
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

	echo -e "\e[032;1mCPU Model:\e[0m $cname"
	echo -e "\e[032;1mNumber Of Cores:\e[0m $cores"
	echo -e "\e[032;1mCPU Frequency:\e[0m $freq MHz"
	echo -e "\e[032;1mTotal Amount Of RAM:\e[0m $tram MB"
	echo -e "\e[032;1mTotal Amount Of Swap:\e[0m $swap MB"
	echo -e "\e[032;1mSystem Uptime:\e[0m $up"
	echo -e "\e[032;1mIsp Name:\e[0m $ISP"
	echo -e "\e[032;1mCity:\e[0m $CITY"
	echo -e "\e[032;1mTime:\e[0m $WKT"
	echo -e "\e[033;1mIPVPS:\e[0m $IPVPS"
	date | lolcat
	echo -e "-----------------------------------------------------"

echo -e ""

echo -e "Menu Utama" | lolcat -a -d 10

echo -e " 01.  Control Panel Wireguard"

echo -e " 02.  Control Panel L2TP & PPTP"

echo -e " 03.  Control Panel SSTP"

echo -e " 04.  Control Panel SSR & Shadowsocks"

echo -e " 05.  Control Panel Vmess/V2ray"

echo -e " 06.  Control Panel Vless"

echo -e " 07.  Control Panel Trojan"

echo -e ""

echo -e "Menu Tambahan" | lolcat -a -d 10

echo -e " 08.  Add Subdomain Host For VPS"

echo -e " 09.  Renew Certificate V2RAY"

echo -e " 10.  Change Port All Account"

echo -e " 11.  Autobackup Data VPS"

echo -e " 12.  Backup Data VPS"

echo -e " 13.  Restore Data VPS"

echo -e " 14.  Limit Bandwith Speed Server"

echo -e " 15.  Check Usage of VPS Ram"

echo -e " 16.  Speedtest VPS"

echo -e " 17.  Information Display System"

echo -e " 18.  Restart All Service"

echo -e " 19.  Set Auto Reboot"

echo -e " 20.  Status Tunneling"

echo -e " 21.  Cek Penggunaan Data User"

echo -e "\e[32m══════════════════════════════════════════\e[m"

echo -e " x.   Exit From Putty / JuiceSSH / Termux"

echo -e "\e[32m══════════════════════════════════════════\e[m"

echo -e ""

read -p "     Please Input Number  [1-22 or x] :  "  num

echo -e ""

case $num in

1)

wgg

;;

2)

ltp

;;

3)

ssstp

;;

4)

sssr

;;

5)

wss

;;

6)

vls

;;

7)

trj

;;

8)

add-host

;;

9)

certv2ray

;;

10)

change-port

;;

11)

autobackup

;;

12)

backup

;;

13)

restore

;;

14)

limit-speed

;;

15)

ram

;;

16)

speedtest

;;

17)

info

;;

18)

restart

;;

19)

auto-reboot

;;


20)

running

;;

21)

cek-usage

;;

x)

exit

;;

*)

echo "Please enter an correct number"

;;

esac
