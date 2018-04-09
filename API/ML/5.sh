#!/bin/bash
echo "-------------------------------"
echo "ชื่อผู้ใช้งาน          วันหมดอายุ     "
echo "-------------------------------"
while read expired
do
        NEKO="$(echo $expired | cut -d: -f1)"
        ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
        exp="$(chage -l $NEKO | grep "Account expires" | awk -F": " '{print $2}')"
        if [[ $ID -ge 1000 ]]; then
        printf "%-17s %2s\n" "$NEKO" "$exp"
        fi
done < /etc/passwd
All="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo "-------------------------------"
echo "New Account : $NEKO user"
echo "-------------------------------"
echo -e "Tonza-VPN"
echo -e ""
