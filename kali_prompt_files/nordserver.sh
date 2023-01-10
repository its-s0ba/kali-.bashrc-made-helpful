#!/bin/bash

server_name=$(nordvpn status | grep -F "Current server:" | cut -d":" -f2 | cut -d " " -f2)

server_ip=$(nordvpn status | grep -F "Server IP:" | cut -d":" -f2 | cut -d " " -f2)

nordserver=$(echo "$server_name@$server_ip")

nordvpn_check=$(nordvpn status | grep -F "Status:" | cut -d":" -f2)
if [[ $nordvpn_check == *"Connected"* ]]
then
   echo "$nordserver"
else
   echo "Not Connected"
fi
