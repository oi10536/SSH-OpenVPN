#!/bin/bash
#TONZA-VPN
#debian 8 MOD BY TONZA-VPN

# go to root
cd

#ca-certificates
apt-get install ca-certificates

# initialisasi var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
MYIP=$(wget -qO- ipv4.icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";
MYPORT="s/85/99/g";

#FIGlet In Linux
sudo apt-get install figlet
yum install figlet

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

# install wget and curl
apt-get update;apt-get -y install wget curl;


# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
service ssh restart

# set repo
wget -O /etc/apt/sources.list "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/sources.list.debian8"
wget "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/dotdeb.gpg"
wget "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/jcameron-key.asc"
cat dotdeb.gpg | apt-key add -;rm dotdeb.gpg
cat jcameron-key.asc | apt-key add -;rm jcameron-key.asc

# update
apt-get update

# install webserver
apt-get -y install nginx

# install essential package
apt-get -y install nano iptables dnsutils openvpn screen whois ngrep unzip unrar

# install neofetch
echo "deb http://dl.bintray.com/dawidd6/neofetch jessie main" | sudo tee -a /etc/apt/sources.list
curl -L "https://bintray.com/user/downloadSubjectPublicKey?username=bintray" -o Release-neofetch.key && sudo apt-key add Release-neofetch.key && rm Release-neofetch.key
apt-get update
apt-get install neofetch

echo "clear" >> .bashrc
echo 'echo -e "ยินดีต้อนรับสู่เซิร์ฟเวอร์ $HOSTNAME"' >> .bashrc
echo 'echo -e "Script mod by TONZA-VPN"' >> .bashrc
echo 'echo -e "พิมพ์ | menu |เพื่อแสดงรายการคำสั่ง"' >> .bashrc
echo 'echo -e ""' >> .bashrc

# install webserver
cd
apt-get -y install nginx php5 php5-fpm php5-cli php5-mysql php5-mcrypt
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/nginx.conf"
mkdir -p /home/vps/public_html
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/vps.conf"
sed -i 's/cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php5/fpm/php.ini
sed -i 's/listen = \/var\/run\/php5-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php5/fpm/pool.d/www.conf
sed -i $MYPORT /etc/nginx/conf.d/vps.conf;
useradd -m vps && mkdir -p /home/vps/public_html
rm /home/vps/public_html/index.html && echo "<?php phpinfo() ?>" > /home/vps/public_html/info.php
chown -R www-data:www-data /home/vps/public_html && chmod -R g+rw /home/vps/public_html
service php5-fpm restart && service nginx restart

# install openvpn
wget -O /etc/openvpn/openvpn.tar "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/openvpn-debian.tar"
cd /etc/openvpn/
tar xf openvpn.tar
wget -O /etc/openvpn/1194.conf "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/1194.conf"
service openvpn restart
sysctl -w net.ipv4.ip_forward=1
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
iptables -t nat -I POSTROUTING -s 192.168.100.0/24 -o eth0 -j MASQUERADE
iptables-save > /etc/iptables_yg_baru_dibikin.conf
wget -O /etc/network/if-up.d/iptables "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/iptables"
chmod +x /etc/network/if-up.d/iptables
service openvpn restart

# konfigurasi openvpn
cd /etc/openvpn/
wget -O /etc/openvpn/client.ovpn "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/client-1194.conf"
sed -i $MYIP2 /etc/openvpn/client.ovpn;
cp client.ovpn /home/vps/public_html/

# install badvpn
cd
wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/badvpn-udpgw"
if [ "$OS" == "x86_64" ]; then
  wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/badvpn-udpgw64"
fi
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300' /etc/rc.local
chmod +x /usr/bin/badvpn-udpgw
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300

# setting port ssh
cd
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 143' /etc/ssh/sshd_config
service ssh restart

# install dropbear
apt-get -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=443/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 443 -p 80"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
service ssh restart
service dropbear restart

# install squid3
cd
apt-get -y install squid3
wget -O /etc/squid3/squid.conf "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/squid3.conf"
sed -i $MYIP2 /etc/squid3/squid.conf;
service squid3 restart

# install webmin
cd
wget -O webmin_1.680_all.deb "http://prdownloads.sourceforge.net/webadmin/webmin_1.680_all.deb"
dpkg -i --force-all webmin_1.680_all.deb;
apt-get -y -f install;
rm /root/webmin_1.680_all.deb
service webmin restart

# download script
cd /usr/bin
wget -O menu "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/menu.sh"
wget -O 01 "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/01.sh"
wget -O 02 "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/02.sh"
wget -O 03 "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/03.sh"
wget -O 04 "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/04.sh"
wget -O 05 "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/05.sh"
wget -O 06 "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/06.sh"
wget -O 07 "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/07.sh"
wget -O 08 "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/08.sh"
wget -O 09 "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/09.sh"
wget -O 10 "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/10.sh"
wget -O 11 "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/11.sh"
wget -O 12 "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/12.sh"
wget -O resvis "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/resvis.sh"
wget -O userlimit "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/user-limit.sh"
wget -O userlimitssh "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/user-limitssh.sh"
wget -O speedtest "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/speedtest_cli.py"

echo "0 0 * * * root /sbin/reboot" > /etc/cron.d/reboot

chmod +x menu
chmod +x 1
chmod +x 2
chmod +x 3
chmod +x 4
chmod +x 5
chmod +x 6
chmod +x 7
chmod +x 8
chmod +x 9
chmod +x 10
chmod +x 11
chmod +x 12
chmod +x resvis
chmod +x userlimit
chmod +x userlimitssh
chmod +x speedtest


cd

MYIP=$(wget -qO- ipv4.icanhazip.com);
cd /etc/openvpn/
wget -q -O /etc/openvpn/client2.ovpn "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/client2.conf"
MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | grep -v '192.168'`;
sed -i s/xxxxxxxxx/$MYIP/g /etc/openvpn/client2.ovpn;

wget -q -O /etc/openvpn/client3pc.ovpn "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/client3pc.conf"

sed -i s/xxxxxxxxx/$MYIP/g /etc/openvpn/client3pc.ovpn;

wget -q -O /etc/openvpn/client.ovpn "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/client-1194.conf"

sed -i s/xxxxxxxxx/$MYIP/g /etc/openvpn/client.ovpn;


cd
#set remote and host

cd /usr/bin
wget -O 13 "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/13.sh"
chmod +x 13
cd 

#reset remote and host

cd /usr/bin
wget -O 14 "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/14.sh"
chmod +x 14

cd 

cp /etc/openvpn/client2.ovpn /home/vps/public_html/client2.ovpn

cp /etc/openvpn/client.ovpn /home/vps/public_html/client.ovpn

cp /etc/openvpn/client3pc.ovpn /home/vps/public_html/computer.ovpn

apt-get install python

cd /usr/local/bin

wget -O bwuser "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/bwuser"
	
chmod +x bwuser
	
cd

#backup

cd /usr/local/bin

wget -O backup "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/backup.sh"
	
chmod +x backup
	
cd

#rebackup

cd /usr/local/bin

wget -O rebackup "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/rebackup.sh"
	
chmod +x rebackup
	
cd

mkdir /home/vps/public_html/hjr

mkdir /home/vps/public_html/hjr2

mkdir /home/vps/public_html/hjr3


#bwh

cd /usr/local/bin

wget -O bwh "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/bwuser"
	
chmod +x bwh
	
cd


--------




# finishing
cd
chown -R www-data:www-data /home/vps/public_html
service nginx start
service openvpn restart
service cron restart
service ssh restart
service dropbear restart
service squid3 restart
service webmin restart
rm -rf ~/.bash_history && history -c
echo "unset HISTFILE" >> /etc/profile

# install myweb
cd /home/vps/public_html/
wget -O /home/vps/public_html/myweb.tar "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/myweb.tar"
cd /home/vps/public_html/
tar xf myweb.tar

# Setting web
echo -e "\033[01;31mIP User And Pass 'ROOT' Only \033[0m"
read -p "IP : " MyIPD
read -p "Username : " Login
read -p "Password : " Passwd
MYIPS="s/xxxxxxxxx/$MyIPD/g";
US1="s/thaivpnuser/$Login/g";
PS2="s/thaivpnpass/$Passwd/g";
sed -i $MYIPS /home/vps/public_html/index.php;
sed -i $US1 /home/vps/public_html/index.php;
sed -i $PS2 /home/vps/public_html/index.php;

#RM file
rm -f myweb.tar
cd
rm -f install.sh

# info
clear
figlet "TONZA-VPN"
echo "Script WebSSH Auto Install"
echo "OpenSSH  : 22, 143"
echo "Dropbear : 80, 443"
echo "Squid3   : 8080, 3128 (limit to IP SSH)"
echo "OpenVPN  : TCP 1194 (client config : http://$MYIP:99/client.ovpn)"
echo "Squid     :  http://$MYIP:8080"
echo "Nginx      :  http://$MYIP:99"
echo "Web    :  http://$MYIP:99"
echo "Webmin   : http://$MYIP:10000/"
echo "IPv6     : [off]"
echo "Modified by TONZA-VPN"
echo "VPS AUTO REBOOT TIAP JAM 12 MALAM"
echo "==========================================="
figlet "TONZA-VPN"
cd
rm -f /root/debian8.sh
