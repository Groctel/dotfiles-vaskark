#!/bin/bash

##
## Lemonbar
## Fonts: scientifica (bdf), nerd font (ttf)
##


. "${HOME}/.cache/wal/colors.sh"

##########


Cmd() {

	ICON="ﲵ"
	echo "%{F#000}%{B"$color1"}%{A:wal -f random_user -o wal-extras.sh:}  $ICON  %{A}%{B-}%{F-}"

}

Session() {

	ICON=""
	echo "%{F#000}%{B"$color5"}  $ICON $DESKTOP_SESSION  %{B-}%{F-}"

}

User() {

	ICON=""
	echo "%{F#000}%{B"$color5"}  $ICON $USER  %{B-}%{F-}"

}

Hostname() {

	HOST=$(uname -n)
	ICON=""
	echo "%{F#000}%{B"$color5"}  $ICON $HOST  %{B-}%{F-}"

}

Uptime() {

	UPTIME=$($HOME/.config/scripts/uptime.sh)
	ICON=""
	echo "%{F#000}%{B"$color5"}  $ICON $UPTIME  %{B-}%{F-}"

}

Weather() {

	WEATHER=$($HOME/.config/scripts/openweathermap-detailed.sh)
	echo "$WEATHER"
	sleep 300

}

Mpc() {

	# Note: freebsd uses musicpd and musicpc

	MPD=$(systemctl --user status mpd | grep inactive)

	if [[ ! -z $MPD ]] ; then
		ICON="ﭵ"
		echo "%{F"#555"}$ICON%{F-} mpd offline"
	else
		MPC=$(mpc current -f "%artist% >> %title%")
		ICON="ﭵ"
		echo "%{A:mpc toggle 1>/dev/null:}%{A2:mpc prev 1>/dev/null:}%{A3:mpc next 1>/dev/null:}%{F"$color2"}$ICON%{F-} $MPC%{A}%{A}%{A}"
	fi

}

Wifi() {

    INTERFACE=$(ip addr | awk '/state UP/ {print $2}' | sed 's/://g')
	WIFISTR=$(iwconfig $INTERFACE | grep "Link" | sed 's/ //g' | sed 's/LinkQuality=//g' | sed 's/\/.*//g')

	if [ ! -z $WIFISTR ] ; then

		WIFISTR=$(( ${WIFISTR} * 100 / 70 ))
		ESSID=$(iwconfig $INTERFACE | grep ESSID | sed 's/ //g' | sed 's/.*://g' | sed 's/\"//g')

		if [ $WIFISTR -ge 1 ] ; then

			R1=`cat /sys/class/net/$INTERFACE/statistics/rx_bytes`
			sleep 1
     		R2=`cat /sys/class/net/$INTERFACE/statistics/rx_bytes`
     		RBPS=`expr $R2 - $R1`
     	    RKBPS=`expr $RBPS / 1024`
     	    MKBPS=`expr $RKBPS / 1024`
     	    ICON="說"
			echo "%{F"$color4"}$ICON%{F-} $ESSID [ $RKBPS Kb/s ] "

		fi

	fi

}

Cpu() {

	CPU=$($HOME/.config/scripts/cpu.sh)
	ICON="﬙"
	echo "%{F"$color4"}$ICON%{F-} $CPU "

}

Battery() {

	CHARGE=$(acpi | grep "Not charging")
	CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)

	if [[ ! -z $CHARGE ]] ; then
		ICON=""
		echo "%{F"$color4"}$ICON%{F-} $CAPACITY% "
	else
  		ICON=""
  		echo "%{F"$color4"}$ICON%{F-} $CAPACITY% "
	fi

}

Memory() {

	T=$(cat /proc/meminfo | grep MemTotal | awk '{print $2}')
	F=$(cat /proc/meminfo | grep MemFree | awk '{print $2}')
	B=$(cat /proc/meminfo | grep Buffers | awk '{print $2}')
	C=$(cat /proc/meminfo | grep Cached | awk 'NR==1 {print $2}')

	USED=$((100*($T - $F - $B - $C) / $T))
	ICON=""
	echo "%{F"$color4"}$ICON%{F-} $USED% "

}

Volume() {

	NOTMUTED=$(amixer -D pulse sget Master | grep "\[on\]")

	if [[ ! -z $NOTMUTED ]] ; then
		VOL=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer -D pulse sget Master) | sed 's/%//g')
		ICON=""
		echo "%{F"$color4"}$ICON%{F-} $VOL% "
	else
		ICON="ﱝ"
		echo "%{F#555}$ICON%{F-} --% " 
	fi

}

Window() {

    WINDOW=$(xdotool getwindowfocus getwindowname)
    echo "  $WINDOW "

}

Date() {

    DATE=$(date +"%a %b %d %Y")
    ICON=""
    echo "%{F#000}%{B"$color2"}  $ICON $DATE  %{B-}%{F-}"

}

Time() {

    TIME=$($HOME/.config/scripts/time.sh)
    ICON=""
    echo "%{A3:gnome-clocks:}%{F#000}%{B"$color2"}  $ICON $TIME  %{B-}%{F-}%{A}"

}


##########


while true; do
    echo -e "\
	%{l}$(Uptime) $(Window) \
	%{c}$(Mpc) \
	%{r}$(Wifi) $(Cpu) $(Battery) $(Memory) $(Volume) $(Time)"
    sleep 0.1
done
