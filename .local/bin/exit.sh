#!/usr/bin/env bash

# exit script
# note: must be in 'operators' group on *bsd

MENU="$(rofi -sep "|" \
	-dmenu \
	-i \
	-p 'Leaving?' \
	-location 0 \
	-hide-scrollbar \
	-font "scientifica bold 8" \
	-theme "~/.cache/wal/colors-rofi-mine.rasi" \
    -theme-str 'window {width: 10%;} listview {lines: 3;}' \
	<<< "Logout|Restart|Shutdown")"

case "$(uname -s)" in
	
	Linux*)
		case "$MENU" in
			*Logout) pkill X ;;
			*Restart) shutdown -r now ;;
			*Shutdown) shutdown now ;;
		esac
	;;

	FreeBSD*)
		case "$MENU" in
			*Logout) pkill X ;;
			*Restart) shutdown -r now ;;
			*Shutdown) shutdown -p now ;;
		esac
	;;			

	OpenBSD*)
		case "$MENU" in
			*Logout) pkill x ;;
			*Restart) shutdown -r now ;;
			*Shutdown) shutdown -p now ;;
		esac
	;;

esac
