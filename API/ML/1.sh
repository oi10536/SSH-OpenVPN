#!/bin/bash
#Script auto create neko user SSH

read -p "Username : " Login
read -p "Password : " Passwd
read -p "Expired (Day): " TimeActive

IP=`dig +short myip.opendns.com @resolver1.opendns.com`
useradd -e `date -d "$TimeActive days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Passwd\n$Passwd\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "\033[01;31m====Detail SSH Account==== \033[0m"
echo -e "Host: $IP" 
echo -e "Port OpenSSH: 22,143"
echo -e "Port Dropbear: 80,443"
echo -e "Port Squid: 8080,3128"
echo -e "Config OpenVPN (TCP 1194): http://$IP:81/client.ovpn"
echo -e "\033[01;34mUsername: $Login \033[0m"
echo -e "\033[01;34mPassword: $Passwd \033[0m"
echo -e "-----------------------------"
echo -e "  วันหมดอายุ : $exp"
echo -e "\033[01;31m============================= \033[0m"
echo -e "Mod by Tonza-VPN"
echo -e ""