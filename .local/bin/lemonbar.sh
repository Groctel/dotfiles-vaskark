#!/bin/bash

##
## Lemonbar
## Fonts: scientifica, siji (default: bdf)
##


# wal
. "${HOME}/.cache/wal/colors.sh"

##########

# cmd
Cmd() {
	ICON=""
	SP=" "
	echo "%{F#000}%{B"$color1"}%{A:wal -f random_user -o wal-extras.sh:}$SP$SP$ICON$SP$SP%{A}%{B-}%{F-}"
}

# session
Session() {
	ICON=""
	SP=" "
	echo "%{F#000}%{B"$color5"}$SP$SP$ICON$SP$DESKTOP_SESSION$SP$SP%{B-}%{F-}"
}

# luser
User() {
	ICON=""
	SP=" "
	echo "%{F#000}%{B"$color5"}$SP$SP$ICON$SP$USER$SP$SP%{B-}%{F-}"
}

# hostname
Hostname() {
	HOST=$(uname -n)
	ICON=""
	SP=" "
	echo "%{F#000}%{B"$color5"}$SP$SP$ICON$SP$HOST$SP$SP%{B-}%{F-}"
}

# uptime
Uptime() {
	UPTIME=$($HOME/.config/scripts/uptime.sh)
	ICON=""
	SP=" "
	echo "%{F#000}%{B"$color5"}$SP$SP$ICON$SP$UPTIME$SP$SP%{B-}%{F-}"
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
	ICON=""
	SP=" "
	echo "%{A:mpc toggle 1>/dev/null:}%{A2:mpc prev 1>/dev/null:}%{A3:mpc next 1>/dev/null:}%{F"$color2"}$ICON%{F-}$SP$MPC%{A}%{A}%{A}"
}

# wifi
Wifi() {
	WIFISTR=$( iwconfig wlp2s0 | grep "Link" | sed 's/ //g' | sed 's/LinkQuality=//g' | sed 's/\/.*//g')
	if [ ! -z $WIFISTR ] ; then
		WIFISTR=$(( ${WIFISTR} * 100 / 70))
		ESSID=$(iwconfig wlp2s0 | grep ESSID | sed 's/ //g' | sed 's/.*://' | cut -d "\"" -f 2)
		if [ $WIFISTR -ge 1 ] ; then
			echo "%{F"$color4"}%{F-} ${ESSID} "
		fi
	fi
}

# cpu
Cpu() {
	CPU=$($HOME/.config/scripts/cpu.sh)
	ICON=""
	SP=" "
	echo "%{F"$color4"}$ICON%{F-}$SP$CPU$SP"
}

# battery
Battery() {
    BAT=$($HOME/.config/scripts/bat.sh)
    ICON=""
    SP=" "
    echo "%{F"$color4"}$ICON%{F-}$SP$BAT$SP"
}

# memory
Memory() {
	T=$(cat /proc/meminfo | grep MemTotal | awk '{print $2}')
	F=$(cat /proc/meminfo | grep MemFree | awk '{print $2}')
	B=$(cat /proc/meminfo | grep Buffers | awk '{print $2}')
	C=$(cat /proc/meminfo | grep Cached | awk 'NR==1 {print $2}')

	USED=$((100*($T - $F - $B - $C) / $T))
	ICON=""
	SP=" "
	echo "%{F"$color4"}$ICON%{F-}$SP$USED%$SP"
}

# volume
Volume() {
	NOTMUTED=$(amixer -D pulse sget Master | grep "\[on\]")
	if [[ ! -z $NOTMUTED ]] ; then
		VOL=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer -D pulse sget Master) | sed 's/%//g')
		ICON=""
		SP=" "
		echo "%{F"$color4"}$ICON%{F-}$SP$VOL%$SP"
	else
		ICON=""
		SP=" "
		echo "%{F#555}$ICON%{F-}$SP--%$SP"
	fi
}

# window name
WindowName() {
    WINDOWNAME=$(xdotool getwindowfocus getwindowname)
    ICON=""
    SP=" "
    echo "$SP$SP$ICON$SP$WINDOWNAME$SP"
}

# date
Date() {
    DATE=$(date +"%a %b %d %Y")
    ICON=""
    SP=" "
    echo "%{F#000}%{B"$color2"}$SP$SP$ICON$SP$DATE$SP$SP%{B-}%{F-}"
}

# time
Time() {
    TIME=$($HOME/.config/scripts/time.sh)
    ICON=""
    SP=" "
    echo "%{A3:gnome-clocks:}%{F#000}%{B"$color2"}$SP$SP$ICON$SP$TIME$SP$SP%{B-}%{F-}%{A}"
}

##########

while true; do
    echo -e "\
	%{l}$(Cmd)$(Uptime)$(WindowName) \
	%{c}$(Mpc) \
	%{r}$(Wifi) $(Cpu) $(Battery) $(Memory) $(Volume) $(Time)"
    sleep 0.1
done
