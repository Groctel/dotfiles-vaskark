#!/bin/bash

## Polybar menu

MENU="$(rofi -sep "|" -dmenu -i -p 'Polybars:' -location 0 -l 3 -font 'scientifica bold 8' -theme-str 'window {width: 15%;}' <<< "Siji|NF|Off")"

case "$MENU" in
	
	*Siji)
		rm -f "$HOME"/.local/bin/polybar-current 2>/dev/null
		ln -s "$HOME"/.local/bin/pb.sh "$HOME"/.local/bin/polybar-current
		killall polybar 2> /dev/null
		polybar-current
	;;

	*NF)
		rm -f "$HOME"/.local/bin/polybar-current 2>/dev/null
		ln -s "$HOME"/.local/bin/pb-nf.sh "$HOME"/.local/bin/polybar-current
		killall polybar 2> /dev/null &
		polybar-current
	;;

	*Off)
		killall polybar
	;;

esac
