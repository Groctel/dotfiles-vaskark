#!/bin/bash

# exit script
# note: must be in 'operators' group on *bsd

MENU="$(rofi -sep "|" \
	-dmenu \
	-i \
	-p 'Leaving?' \
	-location 0 \
	-hide-scrollbar \
    -theme-str 'window {width: 10%;} listview {lines: 3;}' \
	<<< "Logout|Restart|Shutdown")"

case "$(uname -s)" in
	
	Linux*)
		case "$MENU" in
			*Logout) pkill Xorg ;;
			*Restart) shutdown -r now ;;
			*Shutdown) shutdown -P now ;;
		esac
	;;

	OpenBSD*)
		case "$MENU" in
			*Logout) pkill Xorg ;;
			*Restart) shutdown -r now ;;
			*Shutdown) shutdown -p now ;;
		esac
	;;

esac
