#!/bin/bash

## Lemonbar menu

MENU="$(rofi -sep "|" \
	-dmenu -i \
	-p 'Lemonbars:' \
	-location 0 \
	-font 'scientifica bold 8' \
    -theme-str 'window {width: 10%;} listview {lines: 4;}' \
	<<< "Siji|NF|Emoji|Off")"

case "$MENU" in
	
	*Siji)
		rm -f "$HOME"/.local/bin/lemonbar-current 2>/dev/null
		ln -s "$HOME"/.local/bin/lemonbar-start.sh "$HOME"/.local/bin/lemonbar-current
		killall lemonbar
		lemonbar-current
		sed -i "s|offset = .*$|offset = 15x45|g" ~/.cache/wal/dunstrc
		pkill dunst
		berryc edge_gap 40 0 0 0 &
	;;

	*NF)
		rm -f "$HOME"/.local/bin/lemonbar-current 2>/dev/null
		ln -s "$HOME"/.local/bin/lemonbar-nf-start.sh "$HOME"/.local/bin/lemonbar-current
		killall lemonbar
		lemonbar-current
		sed -i "s|offset = .*$|offset = 15x45|g" ~/.cache/wal/dunstrc
		pkill dunst
		berryc edge_gap 40 0 0 0 &
	;;

	*Emoji)
		rm -f "$HOME"/.local/bin/lemonbar-current 2>/dev/null
		ln -s "$HOME"/.local/bin/lemonbar-emoji-start.sh "$HOME"/.local/bin/lemonbar-current
		killall lemonbar
		lemonbar-current
		sed -i "s|offset = .*$|offset = 15x15|g" ~/.cache/wal/dunstrc
		pkill dunst
		berryc edge_gap 0 50 0 0 &
	;;

	*Off)
		killall lemonbar
		sed -i "s|offset = .*$|offset = 15x15|g" ~/.cache/wal/dunstrc
		pkill dunst
	;;

esac
