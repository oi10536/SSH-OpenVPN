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

