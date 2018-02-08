#!/bin/bash
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%35s%s%-20s\n' "การสำรองข้อมูลผู้ใช้ V. 1.2 โดย TONZA-VPN" ; tput sgr0
tput setaf 3 ; tput bold ; echo ""
echo "คำเตือน: นี่คือสคริปต์ทดลองใช้และไม่มีหลักประกันโดยใช้ความเสี่ยงของคุณเอง"
echo "สคริปต์นี้ใช้เพื่อสร้างสำเนาของผู้ใช้และรหัสผ่านทั้งหมด"
echo "เพื่อย้ายไปยังเซิร์ฟเวอร์ใหม่"
echo "หลีกเลี่ยงการทำงานของการสร้างบัญชีผู้ใช้ทั้งหมดอีกครั้ง"
echo "การสำรองข้อมูลนี้ยังรวมถึงรหัสผ่านผู้ใช้ root!" ; tput sgr0

echo ""
echo "คุณต้องการทำอะไร?"
echo ""
echo "1 - สร้างแบ็คอัพ"
echo "2 - คืนค่าการสำรองข้อมูล"
echo "3 - ออก"
echo ""

read -p "Option: " -e -i 3 opcao

if [[ "$option" = '1' ]]; then
	if [ -f "/root/usuarios.db" ]
	then
		echo ""
		echo "การสร้างการสำรองข้อมูล ..."
		echo ""
		tar cvf /root/backup.vps /root/usuarios.db /etc/shadow /etc/passwd /etc/group /etc/gshadow
		echo ""
		echo "สร้างไฟล์ /root/backup.vps เรียบร้อยแล้ว"
		echo ""
	else
		echo ""
		echo "การสร้างการสำรองข้อมูล ..."
		echo ""
		tar cvf /root/backup.vps /etc/shadow /etc/passwd /etc/group /etc/gshadow
		echo ""
		echo "สร้างไฟล์ /root/backup.vps เรียบร้อยแล้ว"
		echo ""
	fi
fi
if [[ "$opcao" = '2' ]]; then
	if [ -f "/root/backup.vps" ]
	then
		echo ""
		echo "กำลังเรียกคืนข้อมูลสำรอง ..."
		echo ""
		sleep 1
		cp /root/backup.vps /backup.vps
		cd /
		tar -xvf backup.vps
		rm /backup.vps
		echo ""
		echo "ผู้ใช้และรหัสผ่านนำเข้าสำเร็จแล้ว"
		echo ""
		exit
	else
		echo ""
		echo "ไม่พบไฟล์ /root/backup.vps"
		echo "ตรวจสอบให้แน่ใจว่าอยู่ในไดเร็กทอรี / root / ชื่อ backup.vps"
		echo ""
		exit
	fi
fi