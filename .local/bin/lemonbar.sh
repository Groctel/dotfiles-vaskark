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

# session
Session() {
	echo -n "%{F#000}%{B"$color01"}  $DESKTOP_SESSION  %{B-}%{F-}"
}

# luser
User() {
	echo -n "%{F#000}%{B"$color04"}  $USER  %{B-}%{F-}"
}

# hostname
Hostname() {
	HOST=$(uname -n)
	echo -n "%{F#000}%{B"$color04"}  $(HOST)  %{B-}%{F-}"
}

# uptime
Uptime() {
	UPTIME=$($HOME/.config/scripts/system-uptime-pretty.sh)
	echo -n "%{F#000}%{B"$color01"}   $UPTIME  %{B-}%{F-}"
}

# weather
Weather() {
	WEATHER=$($HOME/.config/scripts/openweathermap-detailed.sh)
	echo -n "$WEATHER"
	sleep 300
}

# mpc
Mpc() {
	MPC=$(mpc current -f "%artist% >> %title%")
	echo -n "%{A:mpc toggle 1>/dev/null:}%{A2:mpc prev 1>/dev/null:}%{A3:mpc next 1>/dev/null:}%{F"$color02"}%{F-} $MPC%{A}%{A}%{A}"
}

# wifi
Wifi() {
	WIFISTR=$( iwconfig wlp2s0 | grep "Link" | sed 's/ //g' | sed 's/LinkQuality=//g' | sed 's/\/.*//g')
	if [ ! -z $WIFISTR ] ; then
		WIFISTR=$(( ${WIFISTR} * 100 / 70))
		ESSID=$(iwconfig wlp2s0 | grep ESSID | sed 's/ //g' | sed 's/.*://' | cut -d "\"" -f 2)
		if [ $WIFISTR -ge 1 ] ; then
			echo -e "%{F"$color04"}%{F-} ${ESSID}"
		fi
	fi
}

# cpu
Cpu() {
	CPU=$($HOME/.config/scripts/cpu.sh)
	echo -n "%{F"$color04"}%{F-} $CPU"
}

# battery
Battery() {
    BAT=$(acpi --battery | cut -d, -f2)
    echo -n "%{F"$color04"}%{F-}$BAT"
}

# memory
Memory() {
	T=$(cat /proc/meminfo | grep MemTotal | awk '{print $2}')
	F=$(cat /proc/meminfo | grep MemFree | awk '{print $2}')
	B=$(cat /proc/meminfo | grep Buffers | awk '{print $2}')
	C=$(cat /proc/meminfo | grep Cached | awk 'NR==1 {print $2}')

	USED=$(( 100*($T - $F - $B - $C) / $T ))
	echo -e "%{F"$color04"}%{F-} $USED%"
}

# volume
Volume() {
	NOTMUTED=$( amixer -D pulse sget Master | grep "\[on\]" )
	if [[ ! -z $NOTMUTED ]] ; then
		VOL=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer -D pulse sget Master) | sed 's/%//g')
		echo -e "%{F"$color04"}%{F-} $VOL%"
	else
		echo -e "%{F#555}%{F-} --%"
	fi
}

# window name
WindowName() {
    WINDOWNAME=$(xdotool getwindowfocus getwindowname)
    echo -n " $WINDOWNAME"
}

# date
Date() {
    DATE=$(date +"%a %b %d %Y")
    echo -n "%{F#000}%{B"$color02"}   $DATE  %{B-}%{F-}"
}

# time
Time() {
    TIME=$(date +"%-I:%M %p")
    echo -n "%{F#000}%{B"$color02"}   $TIME  %{B-}%{F-}"
}

##########

while true; do
    echo -e "\
	%{l}$(Session)  $(WindowName) \
	%{c}$(Mpc) \
	%{r}$(Wifi)  $(Cpu)  $(Battery)  $(Memory)  $(Volume)  $(Time)"
    sleep 0.1
done
