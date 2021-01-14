#!/bin/sh

output=$(protonvpn status)
connection_status=$(head -n 1 <<< $output | awk '{print $2}')

if [ "$connection_status" = 'Connected' ]
then
  server=$(sed '4q;d' <<< $output | awk '{print $2}')
  echo "[VPN: $server]"
else
  echo "[NO VPN]"
fi

