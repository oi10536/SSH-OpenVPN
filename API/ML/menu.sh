#!/bin/bash
#Menu
echo ""
echo -e "\033[01;34mList คำสั่งที่ใช้กับ vps เครื่องนี้เท่านั้น \033[0m"
echo " ------------------------------- "
echo -e "* menu			: แสดงรายการคำสั่ง"
echo -e "|${color3} 01${color4}|	: เพิ่มผู้ใช้งาน "
echo -e "|${color3} 02${color4}|	: ทดลองใช้งาน "
echo -e "|${color3} 03${color4}|	: ลบผู้ใช้งาน "
echo -e "|${color3} 04${color4}|	: ลบผู้ใช้งานที่หมดอายุ "
echo -e "|${color3} 05${color4}|	: แสดงรายชื่อผู้ใช้งาน "
echo -e "|${color3} 06${color4}|	: แสดงรายชื่อผู้ใช้งาน http injector"
echo -e "|${color3} 07${color4}|	: แสดงรายชื่อผู้ใช้งาน OpenVPN"
echo -e "|${color3} 08${color4}|	: แสดงบัญชีที่กำลังจะหมดอายุภายใน/วัน"
echo -e "|${color3} 09${color4}|	: Banned User SSH"
echo -e "|${color3} 10${color4}|	: Undo Banned User SSH"
echo -e "|${color3} 11${color4}|: เปลี่ยนรหัสหรือจำนวนวัน"
echo -e "|${color3} 12${color4}|: เพิ่มผู้ใช้งานแบบได้ไฟล์ที่ใส่ชื่อกับรหัสเรียบร้อย"
echo -e "|${color3} 13${color4}|: ตั้งค่า รีโมท (remote) และ เพลโหลด (host)"
echo -e "|${color3} 14${color4}|: reset รีโมท และ host เป็นค่าเริ่มต้น"
echo -e "* bwuser : แสดงแบนวิทของบัญชีที่กำลังใช้งาน "
echo -e "* backup : สำรองรายชื่อบัญชี "
echo -e "* rebackup : คืนค่าบัญชีรายชื่อที่สำรอง "
echo -e "* resvis	: restart service dropbear, webmin"
echo -e "                squid3, OpenVPN dan SSH"
echo -e "* userlimit : จำกัด การเข้าสู่ระบบ Dropbear การใช้งาน ให้พิมพ์ userlimit 1"
echo -e "* userlimitssh : จำกัด การเข้าสู่ระบบ sshd การใช้งาน ให้พิมพ์ userlimitssh 1"
echo -e "* reboot	: reboot VPS"
echo -e "* speedtest	: ทดสอบความเร็วของ VPS"
echo -e "* exit		: ออก "
echo -e "                      "
echo -e ""
echo " ------------------------------- "
echo ""
echo -e "\033[01;35mพิมพ์คำสั่ง ตามเมนูข้างบนเท่านั้น  \033[0m"
echo ""
echo " ------------------------------- "
echo ""
