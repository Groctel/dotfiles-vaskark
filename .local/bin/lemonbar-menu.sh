#!/usr/bin/env bash

#
# Lemonbar menu
#

MENU="$(rofi -sep "|" \
	-dmenu -i \
	-p 'Lemonbars' \
	-location 0 \
	-font 'scientifica bold 8' \
	-theme "$HOME/.cache/wal/colors-rofi-mine.rasi" \
    -theme-str 'window {width: 10%;} listview {lines: 3;}' \
	<<< "siji|nf|emoji")"

case "$MENU" in
	
	*siji)
		ln -sf "$HOME"/.local/bin/lemonbar.sh "$HOME"/.local/bin/lemonbar-current
		pkill lemonbar 2>/dev/null
		lemonbar-current
	;;

	*nf)
		ln -sf "$HOME"/.local/bin/lemonbar-nf.sh "$HOME"/.local/bin/lemonbar-current
		pkill lemonbar 2>/dev/null
		lemonbar-current
	;;

	*emoji)
		ln -sf "$HOME"/.local/bin/lemonbar-emoji.sh "$HOME"/.local/bin/lemonbar-current
		pkill lemonbar 2>/dev/null
		lemonbar-current
	;;

esac
