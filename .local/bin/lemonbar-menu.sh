#!/bin/bash

## Lemonbar menu

MENU="$(rofi -sep "|" -dmenu -i -p 'Lemonbar 🍋 ' -location 0 -width 10 -hide-scrollbar -line-padding 4 -padding 20 -lines 2 -font "scientifica bold 8" <<< "on|off")"

case $MENU in
	*on) lemonbar-start.sh ;;
	*off) killall -9 lemonbar ;;
esac
