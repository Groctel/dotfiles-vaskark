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

# user
User() {
        echo -n "%{F#000}%{B"$color04"}  $USER  %{B-}%{F-}"
}

# hostname
Hostname() {
        host=$(uname -n)
        echo -n "%{F#000}%{B"$color04"}  $(host)  %{B-}%{F-}"
}

# uptime
Uptime() {
	up=$($HOME/.config/scripts/system-uptime-pretty.sh)
        echo -n "%{F#000}%{B"$color01"}   $up  %{B-}%{F-}"
}

# weather
Weather() {
	wtr=$($HOME/.config/scripts/openweathermap-detailed.sh)
	echo -n "$wtr"
        sleep 300
}

# mpd
Mpc() {
	MPCCUR=$(mpc current -f "%artist% >> %title%")
	echo -n "%{A:mpc toggle 1>/dev/null:}%{A2:mpc prev 1>/dev/null:}%{A3:mpc next 1>/dev/null:}%{F"$color02"}%{F-} $MPCCUR%{A}%{A}%{A}"
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
	temp=$($HOME/.config/scripts/cpu.sh)
	echo -n "%{F"$color04"}%{F-} $temp"
}

# battery
Battery() {
        BAT=$(acpi --battery | cut -d, -f2)
        echo -n "%{F"$color04"}%{F-}$BAT"
}

# memory
Memory() {
	t=$(cat /proc/meminfo | grep MemTotal | awk '{print $2}')
	f=$(cat /proc/meminfo | grep MemFree | awk '{print $2}')
	b=$(cat /proc/meminfo | grep Buffers | awk '{print $2}')
	c=$(cat /proc/meminfo | grep Cached | awk 'NR==1 {print $2}')

	current=$(( 100*($t - $f - $b - $c) / $t ))
	echo -e "%{F"$color04"}%{F-} $current%"
}

# volume
Volume() {
	NOTMUTED=$( amixer -D pulse sget Master | grep "\[on\]" )
	if [[ ! -z $NOTMUTED ]] ; then
		VOL=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer -D pulse sget Master) | sed 's/%//g')
		echo -e "%{F"$color04"}%{F-} ${VOL}%"
	else
		echo -e "%{F#555}%{F-} --%"
	fi
}

# window name
Window() {
    name=$(xdotool getwindowfocus getwindowname)
    echo -n " $name"
}

# clock
Clock() {
        DATETIME=$(date "+%-I:%M %p")
        echo -n "%{F#000}%{B"$color02"}   $DATETIME  %{B-}%{F-}"
}

##########

while true; do
    echo -e "\
        %{l}$(Session)  $(Window) \
    %{c}$(Mpc) \
    %{r}$(Wifi)  $(Cpu)  $(Battery)  $(Memory)  $(Volume)  $(Clock)"
    sleep 0.1
done
