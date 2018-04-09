#!/bin/bash
#Script auto create trial neko SSH
#this user expire in 1 day


IP=`dig +short myip.opendns.com @resolver1.opendns.com`

Login=arch19`</dev/urandom tr -dc X-Z0-9 | head -c4`
Day="1"
Passwd=`</dev/urandom tr -dc a-f0-9 | head -c9`

useradd -e `date -d "$Day days" +"%Y-%m-%d"` -s /bin/false -M $Login
echo -e "$Passwd\n$Passwd\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "====Trial Neko SSH Account===="
echo -e "Host: $IP" 
echo -e "Port OpenSSH: 22,143"
echo -e "Port Dropbear: 80,443"
echo -e "Port Squid: 8080,3128"
echo -e "Config OpenVPN (TCP 1194): http://$IP:81/client.ovpn"
echo -e "Username: $Login"
echo -e "Password: $Passwd\n"
echo -e "========================="
echo -e "Tonza-VPN"
echo -e ""
