#backupka
echo "     ใช้งานคำสั่งนี้ ต้องมี server สำรองเพื่อใช้ในการ BACKUP เท่านั้น "
echo "     เริ่มกระบวนการ BACKUP USER  "
echo " ---------------------------------"
cp  /etc/passwd /home/vps/public_html/hjr/passwd

cp  /etc/group /home/vps/public_html/hjr/group

cp  /etc/shadow /home/vps/public_html/hjr/shadow

cp  /etc/gshadow /home/vps/public_html/hjr/gshadow

cd /home/vps/public_html/hjr

echo "     ตั้งชื่อไฟล์ที่จะสำรองไฟล์  "
read -p "     ชื่อไฟล์ : " bkuname

tar -czvf $bkuname.tgz /home/vps/public_html/hjr/passwd /home/vps/public_html/hjr/group /home/vps/public_html/hjr/shadow /home/vps/public_html/hjr/gshadow

cd

cp  /home/vps/public_html/hjr/$bkuname.tgz /home/vps/public_html/hjr2/$bkuname.tgz

rm /home/vps/public_html/hjr/*

echo "     ป้อน ค่า IP ที่จะสำรองไฟล์  "
echo " "
read -p "     IP : " hjrip

echo "     ป้อน รหัส ที่จะสำรองไฟล์  "

scp -C -r /home/vps/public_html/hjr2/$bkuname.tgz root@$hjrip:/home/vps/public_html/

echo " "
echo "     ดำเนินการ BACKUP USER เสร็จสิ้น "
echo "     เก็บไว้ที่ IP :$hjrip "
echo "     ชื่อไฟล   :$bkuname  "
echo ""
echo " ---------------------------------"