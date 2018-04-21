#!/bin/bash
  echo -e "ต้องการเปลี่ยนรหัสหรือจำนวนวันใช้งาน"
  echo -e " "
  read -p "ป้อนชื่อที่ต้องการเปลี่ยน : " Login
  echo -e " "
  read -p "รหัสใหม่คือ : " Pass
  echo -e " "
  read -p " จำนวนวันที่ใช้งานได้ : " masaaktif
  userdel $Login
  useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
  exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
  echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
  echo -e "--------------------"
  echo -e "username  $Login"
  echo -e " "
  echo -e "Password  $Pass"
  echo -e " "
  echo -e "วันหมดอายุ  $exp"
  echo -e "===================="
