# download script
cd /usr/bin
wget -O menu "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/menu.sh"
wget -O 1 "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/1.sh"
wget -O 2 "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/2.sh"
wget -O 3 "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/3.sh"
wget -O 4 "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/4.sh"
wget -O 5 "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/5.sh"
wget -O 6 "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/6.sh"
wget -O 7 "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/7.sh"
wget -O 8 "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/8.sh"
wget -O 9 "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/9.sh"
wget -O 10 "https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/API/ML/10.sh"
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
chmod +x userlimit
chmod +x userlimitssh
chmod +x speedtest
