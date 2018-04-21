#!/bin/bash
# Script unlock dropbear, webmin, squid3, openvpn, openssh
echo -e " ป้อนรายชื่อที่จะยกเลิกระงับการเชื่อมต่อ"
echo -e "  "
read -p "Username : " Login

usermod -U $Login
echo -e ""
echo -e "   ดำเนินการเรียบร้อยแล้ว   "
menu
