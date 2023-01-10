#!/bin/bash
nordvpn_ip=$(ip addr | grep nordlynx | grep inet | tr -s " " | cut -d " " -f 3 | cut -d "/" -f 1)

nordvpn_check=$(nordvpn status | grep -F "Status:" | cut -d":" -f2)
if [[ $nordvpn_check == *"Connected"* ]]
then
   echo "$nordvpn_ip"
else
   echo "Not Connected"
fi
