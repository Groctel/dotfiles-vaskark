#!/bin/bash

## Polybar menu

MENU="$(rofi -sep "|" -dmenu -i -p 'Polybars' -location 0 -width 10 -hide-scrollbar -line-padding 4 -padding 20 -lines 3 -font "scientifica bold 8" <<< "main|i3|off")"
            case "$MENU" in
		*main) polybar-main.sh ;;
                *i3) polybar-i3.sh ;;
		*off) killall -9 polybar ;;
            esac
