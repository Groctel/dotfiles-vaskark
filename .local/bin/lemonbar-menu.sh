#!/bin/bash

## Lemonbar menu

MENU="$(rofi -sep "|" \
	-dmenu -i \
	-p 'Lemonbars' \
	-location 0 \
    -theme-str 'window {width: 10%;} listview {lines: 3;}' \
	<<< "siji|nf|emoji")"

case "$MENU" in
	
	*siji)
		ln -sf "$HOME"/.local/bin/lemonbar-start.sh "$HOME"/.local/bin/lemonbar-current
	;;

	*nf)
		ln -sf "$HOME"/.local/bin/lemonbar-nf-start.sh "$HOME"/.local/bin/lemonbar-current
	;;

	*emoji)
		ln -sf "$HOME"/.local/bin/lemonbar-emoji-start.sh "$HOME"/.local/bin/lemonbar-current
	;;

esac

killall lemonbar
lemonbar-current
