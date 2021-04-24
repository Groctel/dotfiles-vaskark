#!/bin/bash

# clock
Clock() {
        DATETIME=$(date "+%-I:%M %p")
        echo -n " $DATETIME"
}

# battery
Battery() {
        BATPERC=$(acpi --battery | cut -d, -f2)
        echo "$BATPERC"
}

# mpc
Mpc() {
	MPCCUR=$(mpc current)
	echo " $MPCCUR"
}

# wifi
Wifi(){
	WIFISTR=$( iwconfig wlp2s0 | grep "Link" | sed 's/ //g' | sed 's/LinkQuality=//g' | sed 's/\/.*//g')
	if [ ! -z $WIFISTR ] ; then
		WIFISTR=$(( ${WIFISTR} * 100 / 70))
		ESSID=$(iwconfig wlp2s0 | grep ESSID | sed 's/ //g' | sed 's/.*://' | cut -d "\"" -f 2)
		if [ $WIFISTR -ge 1 ] ; then
			echo -e " ${WIFISTR}% ${ESSID}"
		fi
	fi
}

# sound
Sound(){
	NOTMUTED=$( amixer sget Master | grep "\[on\]" )
	if [[ ! -z $NOTMUTED ]] ; then
		VOL=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master) | sed 's/%//g')
		if [ $VOL -ge 85 ] ; then
			echo -e " ${VOL}%"
		elif [ $VOL -ge 50 ] ; then
			echo -e " ${VOL}%"
		else
			echo -e " ${VOL}%"
		fi
	else
		echo -e " M"
	fi
}

# load bar
while true; do
    echo -e "%{c}$(Mpc) %{r} $(Wifi) $(Battery) $(Sound) $(Clock) "
        sleep 0.1
done
