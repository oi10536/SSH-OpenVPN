#!/bin/bash
#Script setremote host

cp /etc/openvpn/client2.ovpn /home/vps/public_html/client2.ovpn

cp /etc/openvpn/client.ovpn /home/vps/public_html/client.ovpn

cp /etc/openvpn/client3pc.ovpn /home/vps/public_html/computer.ovpn

cd /home/vps/public_html
echo -e " "
echo -e "     ใส่ชื่อรีโมทตามที่เราต้องการห้ามเกิน"
echo -e "     25 ตัวอักษรและห้ามเว้นวรรค มิฉะนั้น"
echo -e "     ไฟล์อาจใช้งานไม่ได้"
echo -e " --------------------"
echo -e " "

read -p "     ป้อนชื่อรีโมทห้ามมีเว้นวรรค : " bandname
echo -e " "
echo -e "     ป้อนค่า host หรือเพลโหลด"
echo -e "     ***คำเตือน*** ไฟล์อาจไม่สามารถใช้งานได้"
read -p "     ป้อนชื่อ host : " hhos


sed -i s/rrrrrrrrr/$bandname/g /home/vps/public_html/client2.ovpn;

sed -i s/rrrrrrrrr/$bandname/g /home/vps/public_html/client.ovpn;

sed -i s/anywhere.truevisions.tv.ps.line.naver.jp/$hhos/g /home/vps/public_html/client.ovpn;

sed -i s/anywhere.truevisions.tv.ps.line.naver.jp/$hhos/g /home/vps/public_html/client2.ovpn;

sed -i s/anywhere.truevisions.tv.ps.line.naver.jp/$hhos/g /home/vps/public_html/computer.ovpn;

echo -e " --------------------"
echo -e "   รีโมทเก่า rrrrrrrrr"
echo -e " "
echo -e "   host เก่า @anywhere.truevisions.tv.ps.line.naver.jp"

echo -e " --------------------"
echo -e "  รีโมทใหม่  $bandname "
echo -e " "
echo -e "  host ใหม่ @$hhos "
echo -e " --------------------"
cd








