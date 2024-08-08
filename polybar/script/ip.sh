#!/usr/bin/env bash
# ip get local

if [ $(/usr/bin/ifconfig enp0s3 | grep -w "192.168.15.19" | cut -d " " -f10) = "192.168.15.19" ]; then
	ifconfig | grep -w "192.168.15.19" | awk -F " " '{print " " f$2}'
else

	echo "NOT FOUND ERROR"
fi
