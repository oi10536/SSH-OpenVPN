#!/bin/bash
#Script auto create  user SSH

read -p "Username : " Login
read -p "Password : " Passwd
read -p "Expired (Day): " TimeActive

IP=`dig +short myip.opendns.com @resolver1.opendns.com`
useradd -e `date -d "$TimeActive days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Passwd\n$Passwd\n"|passwd $Login &> /dev/null

#create login.ovpn

cd /home/vps/public_html
cp client2.ovpn $Login.ovpn

sed -i s/nnnnnnnnn/$Login/g /home/vps/public_html/$Login.ovpn;

sed -i s/ppppppppp/$Passwd/g /home/vps/public_html/$Login.ovpn;

cd

echo -e ""
echo -e "\033[01;31m====Detail SSH Account==== \033[0m"
echo -e "Host: $IP" 
echo -e " "
echo -e "ไฟล์ที่ใส่ชื่อกับรหัสเรียบร้อยแล้ว"
echo -e "http://$IP:81/$Login.ovpn"
echo -e "\033[01;31mUsername: $Login \033[0m"
echo -e "\033[01;31mPassword: $Passwd \033[0m"
echo -e "-----------------------------"
echo -e "  วันหมดอายุ : $exp"
echo -e " "
echo -e "ไฟล์คอนฟิคสำหรับเซิฟนี้เท่านั้น"
echo -e "http://$IP:99/client.ovpn"
echo -e "\033[01;31m============================= \033[0m"
echo -e "Mod by Tonza-VPN"
echo -e ""
