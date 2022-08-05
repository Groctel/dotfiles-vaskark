#!/usr/bin/env bash

#
# Polybar menu
#

MENU="$(rofi -sep "|" \
	-dmenu \
	-i \
	-p 'Polybars' \
	-location 0 \
	-font 'scientifica bold 8' \
	-theme "$HOME/.cache/wal/colors-rofi-mine.rasi" \
    -theme-str 'window {width: 10%;} listview {lines: 3;}' \
	<<< "siji|nf|emoji")"

PB=$HOME/.config/polybar
CUR=$PB/current

case "$MENU" in
	
	*siji)
		pkill polybar
		ln -sf "$PB"/config.ini "$CUR"
		polybar main -q -r -c "$CUR" &
	;;

	*nf)
		pkill polybar
		ln -sf "$PB"/config-nf.ini "$CUR"
		polybar main -q -r -c "$CUR" &
	;;

	*emoji)
		pkill polybar
		ln -sf "$PB"/config-emoji.ini "$CUR"
		polybar main -q -r -c "$CUR" &
	;;

esac