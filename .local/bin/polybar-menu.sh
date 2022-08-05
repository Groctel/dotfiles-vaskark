#!/usr/bin/env bash

#
# Polybar menu
#

MENU="$(rofi -sep "|" \
	-dmenu -i \
	-p 'Polybars' \
	-location 0 \
	-font 'scientifica bold 8' \
	-theme "$HOME/.cache/wal/colors-rofi-mine.rasi" \
    -theme-str 'window {width: 10%;} listview {lines: 3;}' \
	<<< "siji|nf|emoji")"

case "$MENU" in
	
	*siji)
		pkill polybar
		ln -sf "$HOME"/.config/polybar/config.ini "$HOME"/.config/polybar/current
		polybar main -r -c "$HOME/.config/polybar/current" &
	;;

	*nf)
		pkill polybar
		ln -sf "$HOME"/.config/polybar/config-nf.ini "$HOME"/.config/polybar/current
		polybar main -r -c "$HOME/.config/polybar/current" &
	;;

	*emoji)
		pkill polybar
		ln -sf "$HOME"/.config/polybar/config-emoji.ini "$HOME"/.config/polybar/current
		polybar main -r -c "$HOME/.config/polybar/current" &
	;;

esac