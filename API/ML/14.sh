#!/bin/bash
#Script resethost
echo -e " "
echo -e "     ทั้ง remote และ host จะคืนสู่ค่าเริ่มต้น"
cp /etc/openvpn/client2.ovpn /home/vps/public_html/client2.ovpn

cp /etc/openvpn/client.ovpn /home/vps/public_html/client.ovpn

cp /etc/openvpn/client3pc.ovpn /home/vps/public_html/computer.ovpn

echo -e " "
echo -e "     ดำเนินการเสร็จเรียบร้อยแล้ว"
echo -e " "
