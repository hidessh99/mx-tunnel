#!/bin/bash
#Script By Mardhex
#telegram https://t.me/mardhex
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear
figlet -f small Panel Vless
echo -e ""
echo -e "======================================"
echo -e ""
echo -e "     [1]  Create Vless Websocket Account"
echo -e "     [2]  Delete Vless Websocket Account"
echo -e "     [3]  Renew Vless Account"
echo -e "     [4]  Check User Login Vless"
echo -e "     [x]  Exit"
echo -e "======================================"
echo -e ""
read -p "     Select From Options [1-4 or x] :  " port
echo -e ""
case $port in
1)
add-vless
;;
2)
del-vless
;;
3)
renew-vless
;;
4)
cek-vless
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
