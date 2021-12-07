#!/bin/bash

##
## Lemonbar
## Fonts: scientifica (bdf), siji (bdf)
##


. "$HOME/.cache/wal/colors.sh"

##########


Session() {

	WM="$(xprop -id "$(xprop -root -notype | awk '$1=="_NET_SUPPORTING_WM_CHECK:"{print $5}')" -notype -f _NET_WM_NAME 8t | grep "WM_NAME" | cut -f2 -d \")"
	ICON=""
	echo "%{F#000}%{B$color5}  $ICON $WM  %{B-}%{F-}"

}

User() {

	ICON=""
	echo "%{F#000}%{B$color5}  $ICON $USER  %{B-}%{F-}"

}

Hostname() {

	HOST=$(uname -n)
	ICON=""
	echo "%{F#000}%{B$color5}  $ICON $HOST  %{B-}%{F-}"

}

Uptime() {

	UPTIME=$("$HOME"/.config/scripts/uptime.sh)
	ICON=""
	echo "%{F#000}%{B$color5}%{A3:wal -f random_user -o wal-extras.sh:}  $ICON $UPTIME  %{A}%{B-}%{F-}"

}

Mpc() {

	MPD=$(pgrep -x mpd)

	if [ -n "$MPD" ] ; then
		MPC=$(mpc current -f "%artist% >> %title%")
		ICON=""
		echo "%{A:mpc toggle 1>/dev/null:}%{A2:mpc prev 1>/dev/null:}%{A3:mpc next 1>/dev/null:}%{F$color6}$ICON%{F-} $MPC%{A}%{A}%{A}"
	else
		ICON=""
		echo "%{F#555}$ICON%{F-} mpd offline"
	fi

}

Wifi() {

    INTERFACE=$(ip addr | awk '/state UP/ {print $2}' | sed 's/://g')
	WIFISTR=$(iwconfig "$INTERFACE" | grep "Link" | sed 's/ //g' | sed 's/LinkQuality=//g' | sed 's/\/.*//g') 

	if [ -n "$WIFISTR" ] ; then

		WIFISTR=$(( WIFISTR * 100 / 70 ))
		ESSID=$(iwconfig "$INTERFACE" | grep ESSID | sed 's/ //g' | sed 's/.*://g' | sed 's/\"//g')

     	ICON=""
		echo "%{F$color4}$ICON%{F-} $ESSID "

	fi

}

Cpu() {

	CPU=$("$HOME"/.config/scripts/cpu.sh)
	ICON=""
	echo "%{F$color4}$ICON%{F-} $CPU "

}

Battery() {

	case $(uname -s) in

	Linux*)

		CHARGE=$(acpi | grep "Not charging")
		CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)

		if [ -n "$CHARGE" ] ; then
			ICON=""
			echo "%{F$color4}$ICON%{F-} $CAPACITY% "
		else
  			ICON=""
  			echo "%{F$color4}$ICON%{F-} $CAPACITY% "
		fi

	;;

	OpenBSD*)

		CAPACITY=$(apm | awk 'NR==1 { print $4 }')
	  	ICON=""
  		echo "%{F$color4}$ICON%{F-} $CAPACITY% "

	;;

	FreeBSD*)

		CAPACITY=$(apm | awk 'NR==5 { print $4 }')
		ICON=""
  		echo "%{F$color4}$ICON%{F-} $CAPACITY% "

  	;;

	esac

}

Memory() {

	T=$(grep MemTotal < /proc/meminfo | awk '{print $2}')
	F=$(grep MemFree < /proc/meminfo | awk '{print $2}')
	B=$(grep Buffers < /proc/meminfo | awk '{print $2}')
	C=$(grep Cached < /proc/meminfo | awk 'NR==1 {print $2}')

	USED=$(( 100*(T - F - B - C) / T ))
	ICON=""
	echo "%{F$color4}$ICON%{F-} $USED% "

}

Volume() {

	case $(uname -s) in

	Linux*)

		NOTMUTED=$(amixer -D pulse sget Master | grep "\[on\]")

		if [ -n "$NOTMUTED" ] ; then
			VOL=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer -D pulse sget Master) | sed 's/%//g')
			ICON=""
			echo "%{F$color4}$ICON%{F-} $VOL% "
		else
			ICON=""
			echo "%{F#555}$ICON%{F-} --% "
		fi

	;;

	FreeBSD*)
	
		VOL=$(mixer | grep 'vol' | awk '{ print $7 }' | sed 's/.*://')
		ICON=""
		echo "%{F$color4}$ICON%{F-} $VOL% "

	;;

	OpenBSD*)
		
		VOL=$(pactl list sinks | awk '/Volume: front-left/ { print $5 }' | sed 's/,//')
		ICON=""
		echo "%{F$color4}$ICON%{F-} $VOL% "

	;;

	esac

}

Window() {

    WINDOW=$(xdotool getwindowfocus getwindowname)
    SHORT=${WINDOW:0:75}
    ICON=""
    echo " $ICON $SHORT "

}

Date() {

    DATE=$(date +"%a %b %d %Y")
    ICON=""
    echo "%{F#000}%{B$color6}  $ICON $DATE  %{B-}%{F-}"

}

Time() {

    TIME=$("$HOME"/.config/scripts/time.sh)
    ICON=""
    echo "%{F#000}%{B$color2}  $ICON $TIME  %{B-}%{F-}"

}


##########


while true; do
    echo -e "\
	%{l}$(Uptime) $(Window) \
	%{c}$(Mpc) \
	%{r}$(Wifi) $(Cpu) $(Memory) $(Battery) $(Volume) $(Time)"
    sleep 0.5
done
