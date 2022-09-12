#!/bin/bash
#Script By Mardhex
#telegram https://t.me/mardhex
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear
figlet -f small Panel SSTP
echo -e ""
echo -e "======================================"
echo -e ""
echo -e "     [1]  Create Account SSTP"
echo -e "     [2]  Delete SSTP Account"
echo -e "     [3]  Renew SSTP Account"
echo -e "     [4]  Check User Login SSTP"
echo -e "     [x]  Exit"
echo -e "======================================"
echo -e ""
read -p "     Select From Options [1-4 or x] :  " port
echo -e ""
case $port in
1)
add-sstp
;;
2)
del-sstp
;;
3)
renew-sstp
;;
4)
cek-sstp
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
