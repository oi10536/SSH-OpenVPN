# Script Auto Install SSH & OpenVPN

OpenSSH, port : 22, 143

Dropbear, port : 80, 443

Squid3, port : 8080, 3128

Webmin : http://IPVPS:10000/

OpenVPN TCP 1194


wget https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/debian7.sh && chmod +x debian7.sh && ./debian7.sh

OCS_PanelCentos6

yum -y update && yum -y install wget && wget https://raw.githubusercontent.com/oi10536/SSH-OpenVPN/master/OCSPanelCentOs6.sh && chmod +x OCSCentos.sh && ./OCSCentos.sh && rm -f OCSCentos.sh && history -c
