#!/bin/bash

# exit script
# note: must be in 'operators' group on *bsd

MENU="$(rofi -sep "|" \
	-dmenu \
	-i \
	-p 'Leaving?' \
	-location 0 \
	-width 10 \
	-hide-scrollbar \
	-lines 3 \
	-font "scientifica bold 8" \
	<<< "Logout|Restart|Shutdown")"

case "$MENU" in
	*Logout) pkill x ;;
	*Restart) shutdown -r now ;;
	*Shutdown) shutdown -p now ;;
esac