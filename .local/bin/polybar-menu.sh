#!/bin/bash

## Polybar menu

MENU="$(rofi -sep "|" \
	-dmenu -i \
	-p 'Polybars:' \
	-location 0 \
	-font 'scientifica bold 8' \
    -theme-str 'window {width: 10%;} listview {lines: 5;}' \
	<<< "siji|nf|emoji|---|off")"

case "$MENU" in
	
	*siji)
		killall -q polybar
		rm -f "$HOME"/.local/bin/polybar-current 2>/dev/null
		ln -s "$HOME"/.local/bin/pb.sh "$HOME"/.local/bin/polybar-current
		polybar-current
	;;

	*nf)
		killall -q polybar
		rm -f "$HOME"/.local/bin/polybar-current 2>/dev/null
		ln -s "$HOME"/.local/bin/pb-nf.sh "$HOME"/.local/bin/polybar-current
		polybar-current
	;;

	*emoji)
		killall -q polybar
		rm -f "$HOME"/.local/bin/polybar-current 2>/dev/null
		ln -s "$HOME"/.local/bin/pb-emoji.sh "$HOME"/.local/bin/polybar-current
		polybar-current
	;;

	*off)
		polybar-msg cmd quit
	;;

esac
