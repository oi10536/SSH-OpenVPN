#!/bin/bash
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%33s%s%-12s\n' "เปลี่ยนวันหมดอายุ" ; tput sgr0
echo ""
tput bold ; echo "รายชื่อผู้ใช้และวันหมดอายุ:" ; tput sgr0
echo ""
tput setaf 3 ; tput bold 
awk -F : '$3 >= 500 { print $1 }' /etc/passwd | grep -v '^nobody' | while read user
  do
	expire="$(chage -l $user | grep -E "Account expires" | cut -d ' ' -f3-)"
	if [[ $expire == "never" ]]
	then
		never = "Never"
		printf '  %-30s%s\n' "$user" "Never"
	else
		databr="$(date -d "$expire" +"%Y%m%d")"
		hoje="$(date -d today +"%Y%m%d")"
		if [ $hoje -ge $databr ]
		then
			datanormal="$(date -d"$expire" '+%d/%m/%Y')"
			printf '  %-30s%s' "$user" "$datanormal" ; tput setaf 1 ; tput bold ; echo " (หมดอายุ)" ; tput setaf 3
			echo "exp" > /tmp/exp
		else
			datanormal="$(date -d"$expire" '+%d/%m/%Y')"
			printf '  %-30s%s\n' "$user" "$datanormal"
		fi
	fi
  done
tput sgr0
echo ""
if [ -a /tmp/exp ]
then
	tput setaf 2 ; tput bold ; echo "เมื่อต้องการเอาผู้ใช้หมดอายุทั้งหมดออกใช้คำสั่ง : expcleaner" ; echo "" ; tput sgr0
	rm /tmp/exp
fi
read -p "ชื่อผู้ใช้เพื่อเปลี่ยนวันหมดอายุ : " usuario
if [[ -z $usuario ]]
then
	echo ""
	tput setaf 7 ; tput setab 4 ; tput bold ; echo "คุณป้อนชื่อผู้ใช้ที่ไม่ถูกต้องหรือไม่ถูกต้อง!" ; tput sgr0
	echo ""
	exit 1
else
	if [[ `grep -c /$usuario: /etc/passwd` -ne 0 ]]
	then
		read -p "ป้อนวันหมดอายุใหม่ (DAY / MONTH / YEAR): " inputdate
		sysdate="$(echo "$inputdate" | awk -v FS=/ -v OFS=- '{print $3,$2,$1}')"
		if (date "+%Y-%m-%d" -d "$sysdate" > /dev/null  2>&1)
		then
			if [[ -z $inputdate ]]
			then
				echo ""
				tput setaf 7 ; tput setab 4 ; tput bold ;	echo "คุณป้อนวันที่ไม่ถูกต้องหรือไม่มีอยู่!" ; echo "โปรดป้อนวันที่ที่ถูกต้องในรูปแบบ DAY / MONTH / YEAR" ; echo "ตัวอย่างเช่น: 04/21/2018" ; tput sgr0
				echo ""
				exit 1	
			else
				if (echo $inputdate | egrep [^a-zA-Z] &> /dev/null)
				then
					today="$(date -d today +"%Y%m%d")"
					timemachine="$(date -d "$sysdate" +"%Y%m%d")"
					if [ $today -ge $timemachine ]
					then
						echo ""
						tput setaf 7 ; tput setab 4 ; tput bold ;	echo "คุณป้อนวันที่ผ่านมาหรือวันปัจจุบัน!" ; echo "ป้อนวันที่ในอนาคตและมีผลในรูปแบบ DAY / MONTH / YEAR" ; echo "ตัวอย่างเช่น: 04/21/2018" ; tput sgr0
						echo ""
						exit 1
					else
						chage -E $sysdate $usuario
						echo ""
						tput setaf 7 ; tput setab 1 ; tput bold ; echo "วันหมดอายุของผู้ใช้ $user ได้ถูกเปลี่ยนเป็น: $ inputdate" ; tput sgr0
						echo ""
						exit 1
					fi
				else
					echo ""
					tput setaf 7 ; tput setab 4 ; tput bold ;	echo "คุณป้อนวันที่ไม่ถูกต้องหรือไม่มีอยู่!" ; echo "โปรดป้อนวันที่ที่ถูกต้องในรูปแบบ DAY / MONTH / YEAR" ; echo "ตัวอย่างเช่น: 04/21/2018" ; tput sgr0
					echo ""
					exit 1
				fi
			fi
		else
			echo ""
			tput setaf 7 ; tput setab 4 ; tput bold ;	echo "คุณป้อนวันที่ไม่ถูกต้องหรือไม่มีอยู่!" ; echo "โปรดป้อนวันที่ที่ถูกต้องในรูปแบบ DAY / MONTH / YEAR" ; echo "ตัวอย่างเช่น: 04/21/2018" ; tput sgr0
			echo ""
			exit 1
		fi
	else
		echo " "
		tput setaf 7 ; tput setab 4 ; tput bold ;	echo "ผู้ใช้ $user ไม่อยู่!" ; tput sgr0
		echo " "
		exit 1
	fi
fi
