#!/bin/bash
#Script By Mardhex
#telegram https://t.me/mardhex
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear
figlet -f small Panel SSR
echo -e ""
echo -e "======================================"
echo -e ""
echo -e "     [1]  Create SSR Account"
echo -e "     [2]  Create Shadowsocks Account"
echo -e "     [3]  Deleting SSR Account"
echo -e "     [4]  Delete Shadowsocks Account"
echo -e "     [5]  Renew SSR Account Active"
echo -e "     [6]  Renew Shadowsocks Active"
echo -e "     [7]  Check User Login Shadowsocks"
echo -e "     [8]  Show Other SSR Menu"
echo -e "     [x]  Exit"
echo -e "======================================"
echo -e ""
read -p "     Select From Options [1-8 or x] :  " port
echo -e ""
case $port in
1)
add-ssr
;;
2)
add-ss
;;
3)
del-ssr
;;
4)
del-ss
;;
5)
renew-ssr
;;
6)
renew-ss
;;
7)
cek-ss
;;
8)
ssr
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
