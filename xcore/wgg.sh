#!/bin/bash
#!/bin/bash
#Script By Mardhex
#telegram https://t.me/mardhex
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear
figlet -f small Panel WG | lolcat
echo -e ""
echo -e "======================================" | lolcat
echo -e ""
echo -e "     [1]  Create Wireguard Account"
echo -e "     [2]  Delete Wireguard Account"
echo -e "     [3]  Check User Login Wireguard"
echo -e "     [4]  Renew Wireguard Account"
echo -e "     [x]  Exit"
echo -e "======================================" | lolcat
echo -e ""
read -p "     Select From Options [1-4 or x] :  " port
echo -e ""
case $port in
1)
add-wg
;;
2)
del-wg
;;
3)
cek-wg
;;
4)
renew-wg
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
