#!/usr/bin/env bash
# START VPN TRYHACKME OR HACK THE BOX, NULLBYTE

vpn=$(ifconfig tun0 | grep -o "10\.[0-9]*\.[0-9]*\.[0-9]*" | head -n 1)

if [[ $vpn == 10.* ]]; then
    echo "$vpn"
else
    echo "VPN NOT CONNECTED"
fi
