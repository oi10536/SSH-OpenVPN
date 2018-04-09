#!/bin/bash
# Script unlock dropbear, webmin, squid3, openvpn, openssh
# Dev by Tonza-VPN
# Please in put name user for lock banned user
read -p "Username : " Login
usermod -L $Login