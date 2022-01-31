#!/bin/bash

## Polybar menu

MENU="$(rofi -sep "|" \
	-dmenu -i \
	-p 'Polybars:' \
	-location 0 \
	-font 'scientifica bold 8' \
    -theme-str 'window {width: 10%;} listview {lines: 3;}' \
	<<< "Siji|NF|Off")"

case "$MENU" in
	
	*Siji)
		killall -q polybar 2>/dev/null
		rm -f "$HOME"/.local/bin/polybar-current 2>/dev/null
		ln -s "$HOME"/.local/bin/pb.sh "$HOME"/.local/bin/polybar-current
		polybar-current 2>/dev/null
	;;

	*NF)
		killall -q polybar 2>/dev/null
		rm -f "$HOME"/.local/bin/polybar-current 2>/dev/null
		ln -s "$HOME"/.local/bin/pb-nf.sh "$HOME"/.local/bin/polybar-current
		polybar-current 2>/dev/null 
	;;

	*Off)
		killall -q polybar
	;;

esac
