#!/bin/sh

speed=$(sensors | grep cpu_fan | awk '{print $2; exit}')

if [ "$speed" != "" ]; then
    speed_round=$(echo "$speed/1000" | bc -l | LANG=C xargs printf "%.1f\n")
    echo "  $speed_round"
else
   echo ""
fi
