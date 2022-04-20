#!/usr/bin/env bash

#
# Lemonbar menu
#

MENU="$(rofi -sep "|" \
	-dmenu -i \
	-p 'Lemonbars' \
	-location 0 \
    -theme-str 'window {width: 10%;} listview {lines: 2;}' \
	<<< "siji|nf")"

case "$MENU" in
	
	*siji)
		ln -sf "$HOME"/.local/bin/lemonbar.sh "$HOME"/.local/bin/lemonbar-current
		pkill lemonbar
		lemonbar-current
	;;

	*nf)
		ln -sf "$HOME"/.local/bin/lemonbar-nf.sh "$HOME"/.local/bin/lemonbar-current
		pkill lemonbar
		lemonbar-current
	;;

esac
