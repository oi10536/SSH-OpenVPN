#!/bin/bash
#Script del SSH & OpenVPN
read -p "กรุณาพิมพ์ชื่อผู้ที่ต้องการจะลบ : " User

if getent passwd $User > /dev/null 2>&1; then
        userdel $User
        echo -e "ผู้ใช้งาน $User ได้ลบออกแล้ว"
else
        echo -e "ค้นหา $User ไม่เจอ"
fi
