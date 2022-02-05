#!/bin/bash

## Polybar menu

MENU="$(rofi -sep "|" \
	-dmenu -i \
	-p 'Polybars:' \
	-location 0 \
    -theme-str 'window {width: 10%;} listview {lines: 5;}' \
	<<< "siji|nf|emoji|---|off")"

case "$MENU" in
	
	*siji)
		ln -sf "$HOME"/.local/bin/pb.sh "$HOME"/.local/bin/polybar-current
		polybar-current
	;;

	*nf)
		ln -sf "$HOME"/.local/bin/pb-nf.sh "$HOME"/.local/bin/polybar-current
		polybar-current
	;;

	*emoji)
		ln -sf "$HOME"/.local/bin/pb-emoji.sh "$HOME"/.local/bin/polybar-current
		polybar-current
	;;

	*off)
		polybar-msg cmd quit
	;;

esac
