#!/bin/bash
# Script unlock dropbear, webmin, squid3, openvpn, openssh
# Please in put name user for lock banned user
echo -e " ป้อนรายชื่อที่จะระงับการเชื่อมต่อ "
echo -e "  "
read -p "Username : " Login
usermod -L $Login
echo -e " "
echo -e "   ดำเนินการเรียบร้อยแล้ว   "
echo -e "  "
