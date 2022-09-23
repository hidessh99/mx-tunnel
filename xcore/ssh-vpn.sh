#!/bin/bash
#Script By Mardhex
#telegram https://t.me/mardhex
# ==================================================

# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

#detail nama perusahaan
country=ID
state=Bojonegoro
locality=Indonesia
organization=www.mdxcloud.net
organizationalunit=www.mdxcloud.net
commonname=www.mdxcloud.net
email=admin@mdxcloud.net

# simple password minimal
wget -O /etc/pam.d/common-password "https://${Server}/password"
chmod +x /etc/pam.d/common-password

# go to root
cd

# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

clear

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
#rc.local
# By default this script does nothing.
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#update
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

# install wget and curl
apt -y install wget curl

#figlet
apt-get install figlet -y
apt-get install ruby -y
gem install lolcat

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

# install
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof
echo "clear" >> .profile
echo "neofetch" >> .profile

# install webserver
apt -y install nginx
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://${Server}/nginx.conf"
mkdir -p /home/vps/public_html
wget -O /etc/nginx/conf.d/vps.conf "https://${Server}/vps.conf"
/etc/init.d/nginx restart

# install badvpn
wget -O /bin/badvpn-udpgw "https://${Server}/badvpn-udpgw"
wget -O /usr/bin/badvpn-udpgw "https://${Server}/badvpn-udpgw"
#port BadVPN 7300
sed -i '$ i\screen -dmS udpvpn /bin/badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000 --max-connections-for-client 10
' /etc/rc.local
sed -i '$ i\screen -dmS udpvpn /bin/badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000 --max-connections-for-client 10
' /etc/rc.d/rc.local
#permission
chmod +x /usr/bin/badvpn-udpgw
chmod +x /bin/badvpn-udpgw
chmod +x /etc/rc.local
/etc/rc.d/rc.local
#coba jalankan badvpn 7300
screen -dmS udpvpn /bin/badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000 --max-connections-for-client 10

# setting port ssh
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config

# install dropbear
#apt -y install dropbear
#sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
#sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
#sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 109 -p 69"/g' /etc/default/dropbear
#echo "/bin/false" >> /etc/shells
#echo "/usr/sbin/nologin" >> /etc/shells
#/etc/init.d/dropbear restart

# install squid
cd
#apt -y install squid3
#wget -O /etc/squid/squid.conf "https://${Server}/squid3.conf"
#sed -i $MYIP2 /etc/squid/squid.conf

# setting vnstat
apt -y install vnstat
/etc/init.d/vnstat restart
apt -y install libsqlite3-dev
wget https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6

#install sslh
cd
#wget https://${Server}/sslh.sh && chmod +x sslh.sh && sed -i -e 's/\r$//' sslh.sh && screen -S sslh ./sslh.sh

#Install Edu
#cd
#wget https://${Server}/websocket.sh && chmod +x websocket.sh && ./websocket.sh
#wget https://${Server}/edu.sh && chmod +x edu.sh && screen -S edu ./edu.sh
#rm -f /root/edu.sh
#rm -f /root/websocket.sh
#clear

# install stunnel
#cd
#apt install stunnel4 -y
#cat > /etc/stunnel/stunnel.conf <<-END
#cert = /etc/stunnel/stunnel.pem
#client = no
#socket = a:SO_REUSEADDR=1
#socket = l:TCP_NODELAY=1
#socket = r:TCP_NODELAY=1

#[stunnelws]
#accept = 3127
#connect = 127.0.0.1:443

#[dropbear]
#accept = 222
#connect = 127.0.0.1:22

#[dropbear]
#accept = 777
#connect = 127.0.0.1:22

#[openvpn]
#accept = 442
#connect = 127.0.0.1:1194

END

# make a certificate
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem

# konfigurasi stunnel
#sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
#/etc/init.d/stunnel4 restart

#OpenVPN
wget https://${Server}/vpn.sh &&  chmod +x vpn.sh && ./vpn.sh

# install fail2ban
apt -y install fail2ban

# Instal DDOS Flate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to zaf@vsnl.com'

# banner /etc/issue.net
#wget -O /etc/issue.net "https://${Server}/bannerssh.conf"
#echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
#sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

# blockir torrent
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

#Install Cek Usage
cd /usr/sbin
wget -O cek-usage "https://${Server}/cek-usage.sh"
chmod +x cek-usage

#Install Script
cd /usr/bin
wget -O add-host "https://${Server}/add-host.sh"
wget -O about "https://${Server}/about.sh"
wget -O menu "https://${Server}/menu.sh"
wget -O delete "https://${Server}/delete.sh"
wget -O cek "https://${Server}/cek.sh"
wget -O restart "https://${Server}/restart.sh"
wget -O speedtest "https://${Server}/speedtest_cli.py"
wget -O info "https://${Server}/info.sh"
wget -O ram "https://${Server}/ram.sh"
wget -O renew "https://${Server}/renew.sh"
wget -O ceklim "https://${Server}/ceklim.sh"
wget -O clear-log "https://${Server}/clear-log.sh"
wget -O change-port "https://${Server}/change.sh"
wget -O port-ovpn "https://${Server}/port-ovpn.sh"
wget -O port-ssl "https://${Server}/port-ssl.sh"
wget -O port-wg "https://${Server}/port-wg.sh"
wget -O port-tr "https://${Server}/port-tr.sh"
wget -O port-sstp "https://${Server}/port-sstp.sh"
wget -O port-squid "https://${Server}/port-squid.sh"
wget -O port-ws "https://${Server}/port-ws.sh"
wget -O port-vless "https://${Server}/port-vless.sh"
wget -O xp "https://${Server}/xp.sh"
wget -O kernel-updt "https://${Server}/kernel-update.sh"
wget -O ssstp "https://${Server}/ssstp.sh"
wget -O sssr "https://${Server}/sssr.sh"
wget -O ltp "https://${Server}/ltp.sh"
wget -O wgg "https://${Server}/wgg.sh"
wget -O trj "https://${Server}/trj.sh"
wget -O wss "https://${Server}/wss.sh"
wget -O vls "https://${Server}/vls.sh"
wget -O updatee "https://${Server}/updatee.sh"
wget -O auto-reboot "https://${Server}/auto-reboot.sh"
wget -O tr-mnt "https://${Server}/tr-mnt.sh"
wget -O running "https://${Server}/running.sh"
wget -O cek-user "https://${Server}/cek-user.sh"

chmod +x add-host
chmod +x menu
chmod +x cek
chmod +x restart
chmod +x speedtest
chmod +x info
chmod +x about
chmod +x ceklim
chmod +x ram
chmod +x renew
chmod +x clear-log
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
chmod +x tessh
chmod +x ssstp
chmod +x sssr
chmod +x ltp
chmod +x wgg
chmod +x trj
chmod +x wss
chmod +x vls
chmod +x updatee
chmod +x auto-reboot
chmod +x tr-mnt
chmod +x bbr
chmod +x running
chmod +x cek-user
echo "0 0 * * * root clear-log && reboot" >> /etc/crontab
echo "0 0 * * * root xp" >> /etc/crontab
# remove unnecessary files
cd
apt autoclean -y
apt -y remove --purge unscd
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt-get -y remove sendmail*
apt autoremove -y
# finishing
cd
chown -R www-data:www-data /home/vps/public_html
/etc/init.d/nginx restart
/etc/init.d/openvpn restart
/etc/init.d/cron restart
#/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/fail2ban restart
#/etc/init.d/stunnel4 restart
/etc/init.d/vnstat restart
#/etc/init.d/squid restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
history -c
echo "unset HISTFILE" >> /etc/profile

cd
rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh

# finihsing
clear
