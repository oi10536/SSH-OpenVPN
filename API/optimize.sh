#!/bin/bash
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-15s\n' "เพิ่มประสิทธิภาพเซิร์ฟเวอร์ by TONZA-VPN V. 1.0" ; tput sgr0
echo ""
#
tput setaf 2 ; tput bold ; echo "	การอัพเดตแพ็คเกจ..." ; tput sgr0
#
apt-get update -y 1>/dev/null 2>/dev/null # อัปเดตรายการแพคเกจ 
apt-get upgrade -y 1>/dev/null 2>/dev/null # ทำการปรับปรุง 
apt-get upgrade -f -y 1>/dev/null 2>/dev/null
#
tput setaf 2 ; tput bold ; echo "	กำลังแก้ไขปัญหาการพึ่งพา ... " ; tput sgr0
#
apt-get -f install 1>/dev/null 2>/dev/null # 
แก้ไขปัญหาการพึ่งพาการติดตั้งแพคเกจที่รอดำเนินการเสร็จสมบูรณ์และข้อผิดพลาดอื่น ๆ
#
tput setaf 2 ; tput bold ; echo "	กำลังลบแพคเกจที่ไร้ประโยชน์ ..." ; tput sgr0
#
apt-get autoremove -y 1>/dev/null 2>/dev/null # ลบแพคเกจที่ติดตั้งโดยอัตโนมัติซึ่งไม่มีประโยชน์สำหรับระบบอีกต่อไป
apt-get autoclean -y 1>/dev/null 2>/dev/null # ลบแพคเกจเก่าหรือที่ซ้ำกันออก
#
tput setaf 2 ; tput bold ; echo "	กำลังลบไฟล์ไร้ประโยชน์ออกจากแคช ..." ; tput sgr0
#
apt-get clean -y 1>/dev/null 2>/dev/null # ลบไฟล์ที่ไม่มีประโยชน์ออกจากแคชซึ่งจะลงทะเบียนสำเนาของโปรแกรมปรับปรุงที่ติดตั้งโดยผู้จัดการแพคเกจ
#
tput setaf 2 ; tput bold ; echo "	กำลังนำแพคเกจที่มีปัญหาออก ..." ; tput sgr0
#
apt-get -f remove -y 1>/dev/null 2>/dev/null # ลบแพคเกจที่เป็นปัญหา
#
#Limpar o cache da memoria RAM
tput setaf 7 ; tput setab 1 ; printf '  %-30s%s\n' "------------------------------------------------------------------" ; echo "" ; tput sgr0
echo ""
MEM1=`free|awk '/Mem:/ {print int(100*$3/$2)}'`
free -m 
echo ""
echo "หน่วยความจำ RAM ใช้ก่อนทำความสะอาด:" $MEM1% 
echo ""
tput setaf 7 ; tput setab 1 ; printf '  %-30s%s\n' "------------------------------------------------------------------" ; echo "" ; tput sgr0
echo " "
echo "กำลังทำความสะอาดหน่วยความจำแรม ..."
sleep 3
sync 
echo 3 > /proc/sys/vm/drop_caches
echo "กำลังทำความสะอาดหน่วยความจำ SWAP ..."
echo ""
sleep 4
sync && sysctl -w vm.drop_caches=3 1>/dev/null 2>/dev/null
sysctl -w vm.drop_caches=0 1>/dev/null 2>/dev/null
swapoff -a
swapon -a
tput setaf 7 ; tput setab 1 ; printf '  %-30s%s\n' "------------------------------------------------------------------" ; echo "" ; tput sgr0
echo ""
MEM2=`free|awk '/Mem:/ {print int(100*$3/$2)}'`
free -m 
echo ""
echo "การใช้ RAM หลังจากทำความสะอาด:" $MEM2% "Economia de: " `expr $MEM1 - $MEM2`"%"

tput setaf 7 ; tput setab 1 ; printf '  %-30s%s\n' "------------------------------------------------------------------" ; echo "" ; tput sgr0
