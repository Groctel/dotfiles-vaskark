#!/bin/bash

## Lemonbar menu

MENU="$(rofi -sep "|" -dmenu -i -p 'Lemonbars:' -location 0 -width 10 -lines 5 -font 'scientifica bold 8' <<< "Siji|Siji-b|NF|NF-b|OFF")"

case "$MENU" in
	
	*Siji)
		rm -f "$HOME"/.local/bin/lemonbar-current 2>/dev/null
		ln -s "$HOME"/.local/bin/lemonbar-start.sh "$HOME"/.local/bin/lemonbar-current
		killall -9 lemonbar 2>/dev/null
		lemonbar-current &
		sed -i "s|geometry = .*$|geometry = \"0x0-15+45\"|g" ~/.cache/wal/colors-dunst
		killall -9 dunst 2>/dev/null
		dunst &
		berryc edge_gap 40 0 0 0 &
	;;

	*Siji-b)
		rm -f "$HOME"/.local/bin/lemonbar-current 2>/dev/null
		ln -s "$HOME"/.local/bin/lemonbar-start-b.sh "$HOME"/.local/bin/lemonbar-current
		killall -9 lemonbar 2>/dev/null
		lemonbar-current &
		sed -i "s|geometry = .*$|geometry = \"0x0-15+15\"|g" ~/.cache/wal/colors-dunst
		killall -9 dunst 2>/dev/null
		dunst &
		berryc edge_gap 0 50 0 0 &
	;;

	*NF)
		rm -f "$HOME"/.local/bin/lemonbar-current 2>/dev/null
		ln -s "$HOME"/.local/bin/lemonbar-nf-start.sh "$HOME"/.local/bin/lemonbar-current
		killall -9 lemonbar 2>/dev/null
		lemonbar-current &
		sed -i "s|geometry = .*$|geometry = \"0x0-15+45\"|g" ~/.cache/wal/colors-dunst
		killall -9 dunst 2>/dev/null
		dunst &
		berryc edge_gap 40 0 0 0 &
	;;

	*NF-b)
		rm -f "$HOME"/.local/bin/lemonbar-current 2>/dev/null
		ln -s "$HOME"/.local/bin/lemonbar-nf-start-b.sh "$HOME"/.local/bin/lemonbar-current
		killall -9 lemonbar 2>/dev/null
		lemonbar-current &
		sed -i "s|geometry = .*$|geometry = \"0x0-15+15\"|g" ~/.cache/wal/colors-dunst
		killall -9 dunst 2>/dev/null
		dunst &
		berryc edge_gap 0 50 0 0 &
	;;

	*OFF)
		killall -9 lemonbar 2>/dev/null
	;;

esac
