
#!/bin/bash
#Web Panel
#<BODY text='ffffff'>
# Mod by TOZNA-VPN
# ==================================================
rm -f install
clear
echo ""
echo " Install... ( 1% )"
echo ""
echo " กรุณาใส่รหัสเพื่อติดตั้ง "
echo ""
#user pass
read -p "Password : " chai
if [ $chai -eq 12345 ]; then
clear
echo ""
read -p "รหัสถูกต้องยอมให้ติดตั้งพิมพ์ y : " pungya
	
# go to root
cd

apt-get update 
apt-get -y upgrade


# Install Command
apt-get -y install ufw
echo " Install... ( 2% )
"
apt-get -y install sudo
clear
echo ""
echo " Install... ( 5% )
"
# set repo
wget -q -O /etc/apt/sources.list "https://www.dropbox.com/s/d5mwg1s26rickuh/sources.list.debian8?dl=0"
wget -q "https://www.dropbox.com/s/3upe53rcznbpktz/dotdeb.gpg?dl=0"
wget -q "https://www.dropbox.com/s/3upe53rcznbpktz/dotdeb.gpg?dl=0"
cat dotdeb.gpg | apt-key add -;rm dotdeb.gpg
cat jcameron-key.asc | apt-key add -;rm jcameron-key.asc
clear
echo ""
echo " Install... ( 8% )
"
# update
apt-get update 

# install webserver
apt-get -y install nginx
clear
echo ""
echo " Install... ( 13% )
"
# install essential package
apt-get -y install nano iptables dnsutils openvpn screen whois ngrep unzip unrar
clear
echo ""
echo " Install... ( 20% )
"
echo -e "\033[1;32m "
# install neofetch
echo "deb http://dl.bintray.com/dawidd6/neofetch jessie main" | sudo tee -a /etc/apt/sources.list
curl -L "https://bintray.com/user/downloadSubjectPublicKey?username=bintray" -o Release-neofetch.key && sudo apt-key add Release-neofetch.key && rm Release-neofetch.key
apt-get update
apt-get install neofetch
clear
echo ""
echo " Install... ( 35% )
"
echo "clear" >> .bashrc
echo -e " "
echo 'echo -e "\033[01;32m  }~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{"' >> .bashrc
echo 'echo -e ""' >> .bashrc
echo 'echo -e "  }~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{"' >> .bashrc
echo 'echo -e "   แก้ไขปรับปรุง โดย sangmander kasang "' >> .bashrc
echo 'echo -e "  }~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{"' >> .bashrc
echo 'echo -e "     พิมพ์ m เพื่อดูคำสั่งต่างๆ             "' >> .bashrc
echo 'echo -e "  }~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{"' >> .bashrc
echo -e "\033[1;33m"

# setting time
ln -fs /usr/share/zoneinfo/Asia/Bangkok /etc/localtime
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
service ssh restart
clear
echo ""
echo " Install... ( 37% )
"
echo -e "\033[1;34m"

apt-get update 
# install openvpn
wget -q -O /etc/openvpn/openvpn.tar "https://www.dropbox.com/s/w1zbydlzxza21iu/openvpn-debian.tar?dl=0"
cd /etc/openvpn/
tar xf openvpn.tar
wget -q -O /etc/openvpn/1194.conf "https://www.dropbox.com/s/qrcgihnnknhayzk/1194.conf?dl=0"
service openvpn restart
sysctl -w net.ipv4.ip_forward=1
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
iptables -t nat -I POSTROUTING -s 192.168.100.0/24 -o eth0 -j MASQUERADE
iptables-save > /etc/iptables_yg_baru_dibikin.conf
wget -q -O /etc/network/if-up.d/iptables "https://www.dropbox.com/s/v9lap6mcu7or7cd/iptables?dl=0"
chmod +x /etc/network/if-up.d/iptables
service openvpn restart
clear
echo ""
echo " Install... ( 45% )
"
echo -e "\033[1;35m "

# konfigurasi openvpn
cd /etc/openvpn/
wget -q -O /etc/openvpn/client.ovpn "https://www.dropbox.com/s/79i6z2u70h4ljgz/client-1194.conf?dl=0"
MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | grep -v '192.168'`;
sed -i s/xxxxxxxxx/$MYIP/g /etc/openvpn/client.ovpn;


clear
echo ""
echo " Install... ( 47% )
"
echo -e "\033[1;36m "
apt-get update
# install badvpn
cd
wget -q -O /usr/bin/badvpn-udpgw "https://www.dropbox.com/s/gs0zbg7dshsbhgi/badvpn-udpgw?dl=0"
if [ "$OS" == "x86_64" ]; then
  wget -q -O /usr/bin/badvpn-udpgw "https://www.dropbox.com/s/aktjwjh9y92t39b/badvpn-udpgw64?dl=0"
fi
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300' /etc/rc.local
chmod +x /usr/bin/badvpn-udpgw
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300

clear
echo ""
echo " Install... ( 50% )
"
echo -e "\033[1;31m "
# setting port ssh
cd
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 143' /etc/ssh/sshd_config
service ssh restart
clear
echo ""
echo " Install... ( 52% )
"
echo -e "\033[1;32m "
# install dropbear
apt-get -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=443/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 443 -p 80"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
service ssh restart
service dropbear restart
clear
echo ""
echo " Install... ( 55% )
"
apt-get update 
# install webserver
apt-get -y install nginx php5-fpm php5-cli
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
cat > /etc/nginx/nginx.conf <<END3
user www-data;

worker_processes 1;
pid /var/run/nginx.pid;

events {
	multi_accept on;
  worker_connections 1024;
}

http {
	gzip on;
	gzip_vary on;
	gzip_comp_level 5;
	gzip_types    text/plain application/x-javascript text/xml text/css;

	autoindex on;
  sendfile on;
  tcp_nopush on;
  tcp_nodelay on;
  keepalive_timeout 65;
  types_hash_max_size 2048;
  server_tokens off;
  include /etc/nginx/mime.types;
  default_type application/octet-stream;
  access_log /var/log/nginx/access.log;
  error_log /var/log/nginx/error.log;
  client_max_body_size 32M;
	client_header_buffer_size 8m;
	large_client_header_buffers 8 8m;

	fastcgi_buffer_size 8m;
	fastcgi_buffers 8 8m;

	fastcgi_read_timeout 600;

  include /etc/nginx/conf.d/*.conf;
}
END3
mkdir -p /home/vps/public_html
mkdir -p /home/vps/public_html/ConfigPanel
wget -q -O /home/vps/public_html/index.php "https://www.dropbox.com/s/wurwtyusrnz5gn4/speed.txt?dl=0"
wget -q -O /home/vps/public_html/UserOnline.php "https://www.dropbox.com/s/jgezxrq17f3kulc/api.txt?dl=0"
echo "management localhost 5555" >> /etc/openvpn/1194.conf
echo "<?php phpinfo(); ?>" > /home/vps/public_html/info.php
args='$args'
uri='$uri'
document_root='$document_root'
fastcgi_script_name='$fastcgi_script_name'
cat > /etc/nginx/conf.d/vps.conf <<END4
server {
  listen       81;
  server_name  127.0.0.1 localhost;
  access_log /var/log/nginx/vps-access.log;
  error_log /var/log/nginx/vps-error.log error;
  root   /home/vps/public_html;

  location / {
    index  index.html index.htm index.php;
    try_files $uri $uri/ /index.php?$args;
  }

  location ~ \.php$ {
    include /etc/nginx/fastcgi_params;
    fastcgi_pass  127.0.0.1:9000;
    fastcgi_index index.php;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
  }
}

END4
sed -i 's/listen = \/var\/run\/php5-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php5/fpm/pool.d/www.conf
service php5-fpm restart
service nginx restart
service openvpn restart

clear
echo ""
echo " Install... ( 70% )
"

apt-get update 
apt-get -y upgrade
# Instal (D)DoS Deflate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	0
else
	mkdir /usr/local/ddos
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf https://www.dropbox.com/s/gd0o5997jv7yvx1/ddos.conf?dl=0
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE https://www.dropbox.com/s/17s3lt8ywzpum5g/LICENSE?dl=0
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list https://www.dropbox.com/s/t7jn8xjgbt5n97s/ignore.ip.list?dl=0
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh https://www.dropbox.com/s/67aocv56kseupfi/ddos.sh?dl=0
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo 'done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to zaf@vsnl.com'
fi
clear
echo ""
echo " Install... ( 80% )
"

echo -e "\033[1;33m"
# Install Squid
apt-get -y install squid3
cp /etc/squid3/squid.conf /etc/squid3/squid.conf.orig
wget -q -O /etc/squid3/squid.conf "https://www.dropbox.com/s/223arm2u5ijeysj/squid3.conf?dl=0" 
MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | grep -v '192.168'`;
sed -i s/xxxxxxxxx/$MYIP/g /etc/squid3/squid.conf;
service squid3 restart
clear
echo ""
echo " Install... ( 90% )

"


# install webmin
echo " install Webmin..."
cd
wget http://prdownloads.sourceforge.net/webadmin/webmin_1.680_all.deb
dpkg -i --force-all webmin_1.680_all.deb;
apt-get -y -f install;
rm /root/webmin_1.680_all.deb
service webmin restart



clear
echo ""
echo -e "\033[1;35m"
echo -e "\033[1;35m"

# download script
cd /usr/bin
wget -O install "http://smile-vpn.net/scrip/scrip_350/install"
bash install


echo "30 3 * * * root /sbin/reboot" > /etc/cron.d/reboot

chmod +x kasang
./kasang



wget -O aa "https://www.dropbox.com/s/wz7ygnldgi01bnx/squid.txt?dl=0"
bash aa
rm aa

clear
echo ""
echo -e "\033[1;31m 99% "
echo -e "\033[1;36m "
# finishing
cd
chown -R www-data:www-data /home/vps/public_html
service nginx start
service openvpn restart
service cron restart
service ssh restart
service dropbear restart
service squid3 restart
rm -rf ~/.bash_history && history -c
echo "unset HISTFILE" >> /etc/profile

# info
cp /etc/openvpn/client.ovpn /home/vps/public_html/client.ovpn


# Install Vnstat
apt-get -y install vnstat
vnstat -u -i eth0
sudo chown -R vnstat:vnstat /var/lib/vnstat
service vnstat restart

# Install Vnstat GUI
cd /home/vps/public_html/
wget http://www.sqweek.com/sqweek/files/vnstat_php_frontend-1.5.1.tar.gz
tar xf vnstat_php_frontend-1.5.1.tar.gz
rm vnstat_php_frontend-1.5.1.tar.gz
mv vnstat_php_frontend-1.5.1 vnstat
cd vnstat
sed -i "s/\$iface_list = array('eth0', 'sixxs');/\$iface_list = array('eth0');/g" config.php
sed -i "s/\$language = 'nl';/\$language = 'en';/g" config.php
sed -i 's/Internal/Internet/g' config.php
sed -i '/SixXS IPv6/d' config.php
cd



clear
echo " =============
 
 =============
 Service 
 ---------------------------------------------
 OpenSSH  : 22, 143 
 Dropbear : 80, 443 
 Squid3   : 8080, 3128 (limit to IP SSH) 
 Config   : OpenVPN (TCP 1194)
          : http://$MYIP:81/client.ovpn
 =============================================
 badvpn   : badvpn-udpgw port 7300 
 nginx    : 81 
 Webmin   : http://$MYIP:10000/ 
 Timezone : Asia/Thailand (GMT +7) 
 IPv6     : [off] 
 =============================================
 credit.  : Dev By TONZA-VPN
 ============================================="
echo " TONZA-VPN "
echo " ===================================== " 
echo ""
echo " พิมพ์ menu เพื่อการเข้าใช้งาน "
echo ""
echo " ===================================== "
mkdir -p /home/v1

else 
echo ""
echo " รหัสไม่ถูกต้อง ติดต่อ TONZA-VPN " 
exit
fi