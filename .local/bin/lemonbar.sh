#!/bin/bash

## colors

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

## modules

Session() {
	session=$(echo $DESKTOP_SESSION)
	echo -e "%{F#000000}%{B"$color01"}  $session  %{B-}%{F-}"
}

Mpc() {
	MPCCUR=$(mpc current)
	echo "%{F"$color04"}%{F-} $MPCCUR"
}

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

Battery() {
        BATPERC=$(acpi --battery | cut -d, -f2)
        echo "%{F"$color03"}%{F-}$BATPERC"
}

Memory() {
	mem=$(free -m | awk 'NR==2 {print $3}')
	echo -e "%{F"$color01"}%{F-} $mem Mb"
}

Volume() {
	NOTMUTED=$( amixer sget Master | grep "\[on\]" )
	if [[ ! -z $NOTMUTED ]] ; then
		VOL=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master) | sed 's/%//g')
		if [ $VOL -ge 85 ] ; then
			echo -e "%{F"$color06"}%{F-} ${VOL}%"
		elif [ $VOL -ge 50 ] ; then
			echo -e "%{F"$color06"}%{F-} ${VOL}%"
		else
			echo -e "%{F"$color06"}%{F-} ${VOL}%"
		fi
	else
		echo -e "%{F#555555}%{F-} --%"
	fi
}

Clock() {
        DATETIME=$(date "+%-I:%M %p")
        echo -n "%{F#000000}%{B"$color02"}   $DATETIME  %{B-}%{F-}"
}

####################

while true; do
    echo -e "\
        %{l}$(Session) \
    %{c}%{A:mpc toggle 1>/dev/null:}%{A2:mpc prev 1>/dev/null:}%{A3:mpc next 1>/dev/null:}$(Mpc)%{A}%{A}%{A} \
    %{r}$(Wifi)  $(Battery)  $(Memory)  $(Volume)  $(Clock)"
    sleep 0.5
done
