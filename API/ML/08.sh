
#function not_expired_users
    cat /etc/shadow | cut -d: -f1,8 | sed /:$/d > /tmp/expirelist.txt
    totalaccounts=`cat /tmp/expirelist.txt | wc -l`
echo " "
echo "------------------------------"
   
echo "     ป้อนจำนวนวันที่จะหมดอายุ ภายใน "
echo " "
read -p "     ใส่จำนวนวัน : " exd
echo " "
echo "------------------------------"
echo "     รายชื่อที่จะหมดอายุภายใน $exd วันนี้ "
echo " "
    for((i=1; i<=$totalaccounts; i++ )); do
        tuserval=`head -n $i /tmp/expirelist.txt | tail -n 1`
        username=`echo $tuserval | cut -f1 -d:`
        userexp=`echo $tuserval | cut -f2 -d:`
        userexpireinseconds=$(( $userexp * 86400 ))

        todaystime=`date +%s`
        
        if [ $userexpireinseconds -ge $todaystime ] ; then

        timeto2days=$(( $todaystime +(86400 * $exd )))

        if [ $userexpireinseconds -le $timeto2days ] ; then
            echo "       $username    "
        fi
        fi
    done
echo " "
echo "------------------------------"
rm /tmp/expirelist.txt






