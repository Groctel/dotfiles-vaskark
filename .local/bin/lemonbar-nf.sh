#!/bin/bash

# wal
. "${HOME}/.cache/wal/colors.sh"

##########

# session
Session() {
	echo "%{F#000}%{B"$color1"}  $DESKTOP_SESSION  %{B-}%{F-}"
}

# luser
User() {
	echo "%{F#000}%{B"$color1"}  $USER  %{B-}%{F-}"
}

# hostname
Hostname() {
	HOST=$(uname -n)
	echo "%{F#000}%{B"$color1"}  $HOST  %{B-}%{F-}"
}

# uptime
Uptime() {
	UPTIME=$($HOME/.config/scripts/uptime.sh)
	echo "%{F#000}%{B"$color1"}   $UPTIME  %{B-}%{F-}"
}

# weather
Weather() {
	WEATHER=$($HOME/.config/scripts/openweathermap-detailed.sh)
	echo "$WEATHER"
	sleep 300
}

# mpc
Mpc() {
	MPC=$(mpc current -f "%artist% >> %title%")
	echo "%{A:mpc toggle 1>/dev/null:}%{A2:mpc prev 1>/dev/null:}%{A3:mpc next 1>/dev/null:}%{F"$color4"}ﭵ%{F-} $MPC%{A}%{A}%{A}"
}

# wifi
Wifi() {
	WIFISTR=$( iwconfig wlp2s0 | grep "Link" | sed 's/ //g' | sed 's/LinkQuality=//g' | sed 's/\/.*//g')
	if [ ! -z $WIFISTR ] ; then
		WIFISTR=$(( ${WIFISTR} * 100 / 70))
		ESSID=$(iwconfig wlp2s0 | grep ESSID | sed 's/ //g' | sed 's/.*://' | cut -d "\"" -f 2)
		if [ $WIFISTR -ge 1 ] ; then
			echo "%{F"$color2"}說%{F-} ${ESSID} "
		fi
	fi
}

# cpu
Cpu() {
	CPU=$($HOME/.config/scripts/cpu.sh)
	echo "%{F"$color2"}﬙%{F-} $CPU "
}

# battery
Battery() {
    BAT=$($HOME/.config/scripts/bat.sh)
    echo "%{F"$color2"}%{F-} $BAT "
}

# memory
Memory() {
	T=$(cat /proc/meminfo | grep MemTotal | awk '{print $2}')
	F=$(cat /proc/meminfo | grep MemFree | awk '{print $2}')
	B=$(cat /proc/meminfo | grep Buffers | awk '{print $2}')
	C=$(cat /proc/meminfo | grep Cached | awk 'NR==1 {print $2}')

	USED=$((100*($T - $F - $B - $C) / $T))
	echo "%{F"$color2"}%{F-} $USED% "
}

# volume
Volume() {
	NOTMUTED=$(amixer -D pulse sget Master | grep "\[on\]")
	if [[ ! -z $NOTMUTED ]] ; then
		VOL=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer -D pulse sget Master) | sed 's/%//g')
		echo "%{F"$color2"}墳%{F-} $VOL% "
	else
		echo "%{F#555}婢%{F-} --% "
	fi
}

# window name
WindowName() {
    WINDOWNAME=$(xdotool getwindowfocus getwindowname)
    echo " 类 $WINDOWNAME "
}

# date
Date() {
    DATE=$(date +"%a %b %d %Y")
    echo "%{F#000}%{B"$color2"}   $DATE  %{B-}%{F-}"
}

# time
Time() {
    TIME=$($HOME/.config/scripts/time.sh)
    echo "%{A3:gnome-clocks:}%{F#000}%{B"$color2"}  祥 $TIME  %{B-}%{F-}%{A}"
}

##########

while true; do
    echo -e "\
	%{l}$(Uptime) $(WindowName) \
	%{c}$(Mpc) \
	%{r}$(Wifi) $(Cpu) $(Battery) $(Memory) $(Volume) $(Time)"
    sleep 0.1
done
