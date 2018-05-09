#rebackupka
echo " "
echo "     เลือกไฟล์ที่จะคืนค่าสำรอง "
echo " "
read -p "  ชื่อไฟล์ : " jernx

echo " "
echo "     ป้อน ค่า IP ที่เก็บสำรองไฟล์  "
read -p "     IP : " hjrip
echo " "
echo "     ป้อน รหัส เพื่อคืนค่าสำรอง  "

scp -C -r root@$hjrip:/home/vps/public_html/$jernx.tgz /home/vps/public_html/hjr2/

cd /home/vps/public_html/hjr2

tar -xzvf $jernx.tgz 

cd

cp /home/vps/public_html/hjr2/home/vps/public_html/hjr/passwd /etc/passwd

cp /home/vps/public_html/hjr2/home/vps/public_html/hjr/group /etc/group

cp /home/vps/public_html/hjr2/home/vps/public_html/hjr/shadow /etc/shadow

cp /home/vps/public_html/hjr2/home/vps/public_html/hjr/gshadow /etc/gshadow

rm /home/vps/public_html/hjr2/home/vps/public_html/hjr/*

echo " "
echo " ---------------------------------"
echo " "
echo "     ได้คืนค่าบัญชีรายชื่อ จากไฟล์ชื่อ $jernx "
echo " "
echo "     จาก server IP : @$hjrip "
echo " "
echo "     คำเตือน ถ้า BACKUP จาก server อื่น ให้ ทำการเปลี่ยนรหัส root ใหม่  "
echo " "
echo "     เพราะจะเข้า server ไม่ได้เพราะรหัส root เป็นของ server ที่ BACKUP มา  "
echo " "
echo "     เปลี่ยนรหัส root พิมพ์คำสั่ง passwd root  "
echo " "
echo " ---------------------------------"