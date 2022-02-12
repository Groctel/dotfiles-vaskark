#!/bin/bash

## Polybar menu

MENU="$(rofi -sep "|" \
	-dmenu -i \
	-p 'Polybars' \
	-location 0 \
    -theme-str 'window {width: 10%;} listview {lines: 3;}' \
	<<< "siji|nf|emoji")"

case "$MENU" in
	
	*siji)
		ln -sf "$HOME"/.local/bin/pb.sh "$HOME"/.local/bin/polybar-current
	;;

	*nf)
		ln -sf "$HOME"/.local/bin/pb-nf.sh "$HOME"/.local/bin/polybar-current
	;;

	*emoji)
		ln -sf "$HOME"/.local/bin/pb-emoji.sh "$HOME"/.local/bin/polybar-current
	;;

esac

polybar-current