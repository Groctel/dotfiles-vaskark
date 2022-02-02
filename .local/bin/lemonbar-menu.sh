#!/bin/bash

## Lemonbar menu

MENU="$(rofi -sep "|" \
	-dmenu -i \
	-p 'Lemonbars:' \
	-location 0 \
	-font 'scientifica bold 8' \
    -theme-str 'window {width: 10%;} listview {lines: 5;}' \
	<<< "siji|nf|emoji|---|off")"

case "$MENU" in
	
	*siji)
		killall lemonbar
		rm -f "$HOME"/.local/bin/lemonbar-current 2>/dev/null
		ln -s "$HOME"/.local/bin/lemonbar-start.sh "$HOME"/.local/bin/lemonbar-current
		lemonbar-current
	;;

	*nf)
		killall lemonbar
		rm -f "$HOME"/.local/bin/lemonbar-current 2>/dev/null
		ln -s "$HOME"/.local/bin/lemonbar-nf-start.sh "$HOME"/.local/bin/lemonbar-current
		lemonbar-current
	;;

	*emoji)
		killall lemonbar
		rm -f "$HOME"/.local/bin/lemonbar-current 2>/dev/null
		ln -s "$HOME"/.local/bin/lemonbar-emoji-start.sh "$HOME"/.local/bin/lemonbar-current
		lemonbar-current
	;;

	*off)
		killall lemonbar
	;;

esac
