#!/usr/bin/env bash
# START VPN TRYHACKME DARKSEC

vpn=$(ifconfig tun0 | grep "10" | head -n 1 | cut -d " " -f10)

if [ "$vpn" = "<your vpn ip>" ]; then // ip your vpn

	echo "$vpn"
else

	echo "VPN NÃO CONECTADA"
fi
