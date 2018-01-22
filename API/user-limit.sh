#!/bin/bash
PARAM=$1
clear

echo -n > /tmp/pid2
ps ax|grep dropbear > /tmp/pid
cat /tmp/pid | grep -i 'dropbear -p' > /tmp/pids
cat /var/log/auth.log |  grep -i "Password auth succeeded" > /tmp/sks
perl -pi -e 's/Password auth succeeded for//g' /tmp/sks
perl -pi -e 's/dropbear//g' /tmp/sks

cat /tmp/pid | while read line;do
set -- $line
p=$1
var=`cat /tmp/sks | grep -i $1`
set -- $var
l=$6
if [ "$6" != '' ]
then
echo "$p $l" | cat - /tmp/pid2 > /tmp/temp && mv /tmp/temp /tmp/pid2
fi
 done

case $PARAM in

1)
echo -n > /tmp/user1
cat /tmp/pid2 | while read line;do
set -- $line
p=$1
u=$2
cat /tmp/user1 | grep -i $u > /dev/null
if [ $? = 1 ];then
echo $line >> /tmp/user1
else
kill $p
echo "kill $p user $u" 
fi
done
rm -f /tmp/pid
rm -f /tmp/pid2
rm -f /tmp/pids
rm -f /tmp/sks
rm -f /tmp/user1
exit 0
;;
2)
echo -n > /tmp/user1
echo -n > /tmp/user2
cat /tmp/pid2 | while read line;do
set -- $line
p=$1
u=$2
cat /tmp/user1 | grep -i $u > /dev/null
if [ $? = 1 ];then
echo $line >> /tmp/user1
else
cat /tmp/user2 | grep -i $u > /dev/null
if [ $? = 1 ];then
echo $line >> /tmp/user2
else
kill $p
echo "kill $p user $u"
fi
fi
done
rm -f /tmp/pid
rm -f /tmp/pid2
rm -f /tmp/pids
rm -f /tmp/sks
rm -f /tmp/user1
rm -f /tmp/user2
exit 0
;;
*)
  echo " ใช้คำสั่ง ./userlimit.sh 1 สำหรับการเข้าสู่ระบบแบบ จำกัด 1 เท่านั้น"
  echo " ใช้คำสั่ง ./userlimit.sh 2 เพื่อเพิ่มการเข้าสู่ระบบสูงสุด 2 ครั้ง"   
rm -f /tmp/pid
rm -f /tmp/pid2
rm -f /tmp/pids
rm -f /tmp/sks
exit 1
;;

esac


PARAM=$1
echo -n > /tmp/pid2
ps ax|grep sshd > /tmp/pid
cat /tmp/pid | grep -i 'sshd -p' > /tmp/pids
cat /var/log/auth.log |  grep -i "Accepted password for" > /tmp/sks
perl -pi -e 's/Accepted password for for//g' /tmp/sks
perl -pi -e 's/sshd//g' /tmp/sks

cat /tmp/pid | while read line;do
set -- $line
p=$1
var=`cat /tmp/sks | grep -i $1`
set -- $var
l=$6
if [ "$6" != '' ]
then
echo "$p $l" | cat - /tmp/pid2 > /tmp/temp && mv /tmp/temp /tmp/pid2
fi
 done
case $PARAM in
1)
echo -n > /tmp/user1
cat /tmp/pid2 | while read line;do
set -- $line
p=$1
u=$2
cat /tmp/user1 | grep -i $u > /dev/null
if [ $? = 1 ];then
echo $line >> /tmp/user1
else
kill $p
echo "kill $p user $u" 
fi
done
rm -f /tmp/pid
rm -f /tmp/pid2
rm -f /tmp/pids
rm -f /tmp/sks
rm -f /tmp/user1
exit 0
;;
2)
echo -n > /tmp/user1
echo -n > /tmp/user2
cat /tmp/pid2 | while read line;do
set -- $line
p=$1
u=$2
cat /tmp/user1 | grep -i $u > /dev/null
if [ $? = 1 ];then
echo $line >> /tmp/user1
else
cat /tmp/user2 | grep -i $u > /dev/null
if [ $? = 1 ];then
echo $line >> /tmp/user2
else
kill $p
echo "kill $p user $u"
fi
fi
done
rm -f /tmp/pid
rm -f /tmp/pid2
rm -f /tmp/pids
rm -f /tmp/sks
rm -f /tmp/user1
rm -f /tmp/user2
exit 0
;;
*)
  echo " ใช้คำสั่ง userlmtop 1 เพื่อ จำกัด การล็อกอิน 1 ครั้งเท่านั้น"
  echo " ใช้คำสั่ง userlmtop 2 เพื่อสร้างการเข้าสู่ระบบสูงสุด 2 ครั้ง"
  echo " Modified by Tonza-VPN"     
rm -f /tmp/pid
rm -f /tmp/pid2
rm -f /tmp/pids
rm -f /tmp/sks
exit 1
;;

esac


