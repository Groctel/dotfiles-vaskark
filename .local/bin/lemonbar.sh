#!/bin/bash

# colors
color00=$(sed -n 1p ~/.cache/wal/colors)
color01=$(sed -n 2p ~/.cache/wal/colors)
color02=$(sed -n 3p ~/.cache/wal/colors)
color03=$(sed -n 4p ~/.cache/wal/colors)
color04=$(sed -n 5p ~/.cache/wal/colors)
color05=$(sed -n 6p ~/.cache/wal/colors)
color06=$(sed -n 7p ~/.cache/wal/colors)
color07=$(sed -n 8p ~/.cache/wal/colors)
color08=$(sed -n 9p ~/.cache/wal/colors)
color09=$(sed -n 10p ~/.cache/wal/colors)
color10=$(sed -n 11p ~/.cache/wal/colors)
color11=$(sed -n 12p ~/.cache/wal/colors)
color12=$(sed -n 13p ~/.cache/wal/colors)
color13=$(sed -n 14p ~/.cache/wal/colors)
color14=$(sed -n 15p ~/.cache/wal/colors)
color15=$(sed -n 16p ~/.cache/wal/colors)

# clock
Clock() {
        DATETIME=$(date "+%-I:%M %p")
        echo -n "%{F"$color02"}%{F-} $DATETIME"
}

# battery
Battery() {
        BATPERC=$(acpi --battery | cut -d, -f2)
        echo "%{F"$color03"}%{F-}$BATPERC"
}

# mpc
Mpc() {
	MPCCUR=$(mpc current)
	echo "%{F"$color04"}%{F-} $MPCCUR"
}

# wifi
Wifi(){
	WIFISTR=$( iwconfig wlp2s0 | grep "Link" | sed 's/ //g' | sed 's/LinkQuality=//g' | sed 's/\/.*//g')
	if [ ! -z $WIFISTR ] ; then
		WIFISTR=$(( ${WIFISTR} * 100 / 70))
		ESSID=$(iwconfig wlp2s0 | grep ESSID | sed 's/ //g' | sed 's/.*://' | cut -d "\"" -f 2)
		if [ $WIFISTR -ge 1 ] ; then
			echo -e "%{F"$color05"}%{F-} ${ESSID}"
		fi
	fi
}

# sound
Sound(){
	NOTMUTED=$( amixer sget Master | grep "\[on\]" )
	if [[ ! -z $NOTMUTED ]] ; then
		VOL=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master) | sed 's/%//g')
		if [ $VOL -ge 85 ] ; then
			echo -e "%{F"$color06"}%{F-} ${VOL}%"
		elif [ $VOL -ge 50 ] ; then
			echo -e "%{F"$color07"}%{F-} ${VOL}%"
		else
			echo -e "%{F"$color07"}%{F-} ${VOL}%"
		fi
	else
		echo -e "%{F"$color08"}%{F-} M"
	fi
}

##########

# bar
while true; do
    echo -e "%{c}$(Mpc) %{r} $(Wifi) $(Battery) $(Sound) $(Clock) "
        sleep 0.1
done
