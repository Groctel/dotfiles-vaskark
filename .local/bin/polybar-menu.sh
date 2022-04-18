#!/usr/bin/env bash

#
# Polybar menu
#

MENU="$(rofi -sep "|" \
	-dmenu -i \
	-p 'Polybars' \
	-location 0 \
    -theme-str 'window {width: 10%;} listview {lines: 3;}' \
	<<< "siji|nf|emoji")"

case "$MENU" in
	
	*siji)
		ln -sf "$HOME"/.local/bin/polybar.sh "$HOME"/.local/bin/polybar-current
		polybar-current
	;;

	*nf)
		ln -sf "$HOME"/.local/bin/polybar-nf.sh "$HOME"/.local/bin/polybar-current
		polybar-current
	;;

	*emoji)
		ln -sf "$HOME"/.local/bin/polybar-emoji.sh "$HOME"/.local/bin/polybar-current
		polybar-current
	;;

esac