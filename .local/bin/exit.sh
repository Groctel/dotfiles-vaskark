#!/bin/bash

# exit script
# note: must be in 'operators' group on *bsd

MENU="$(rofi -sep "|" -dmenu -i -p 'Exit:' -location 0 -width 8 -hide-scrollbar -line-padding 4 -padding 20 -lines 5 -font "scientifica bold 8" <<< "Lock|Logout|Restart|Shutdown|Cancel")"

case $(uname -s) in
	Linux*)
		case "$MENU" in
			*Lock) lock.sh ;;
			*Logout) pkill x ;;
			*Restart) shutdown -r now ;;
    		*Shutdown) shutdown -p now ;;
		esac
		;;
	OpenBSD*)
		case "$MENU" in
			*Lock) lock.sh ;;
			*Logout) pkill x ;;
			*Restart) shutdown -r now ;;
			*Shutdown) shutdown now ;;
		esac
		;;
esac
