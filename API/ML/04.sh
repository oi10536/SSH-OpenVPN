#!/bin/bash
# Script delete expired user dropbear, webmin, squid3, openvpn, openssh
# Dev by Tonza-VPN

read -r -p "Are You Sure? [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
datenow=$(date +%s)
 for user in $(awk -F: '{print $1}' /etc/passwd); do
  expdate=$(chage -l $user|awk -F: '/Account expires/{print $2}')
  echo $expdate|grep -q never && continue
  echo -n "User \`$user' expires on $expdate ... "
  expsec=$(date +%s --date="$expdate")
  diff=$(echo $datenow - $expsec|bc -l)
  echo $diff|grep -q ^\- && echo okay && continue
  echo deleting...
  done
 ;;
 
     [nN][oO]|[nN])
 echo "No"
        ;;
 
     *)
 echo "Invalid input..."
 ;;
 esac
