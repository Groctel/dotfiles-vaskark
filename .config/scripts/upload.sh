#!/bin/bash

# upload
INTERFACE=$(ip addr | awk '/state UP/ {print $2}' | sed 's/://g')
WIFISTR=$(iwconfig "$INTERFACE" | grep "Link" | sed 's/ //g' | sed 's/LinkQuality=//g' | sed 's/\/.*//g') 

UP=$(ifstat -i "$INTERFACE" 0.1s 1 | awk 'NR==3 {print $2}')
echo "Upload: $UP Kb/s"
