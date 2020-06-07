#!/bin/bash

## Polybar menu

MENU="$(rofi -sep "|" -dmenu -i -p 'Polybars' -location 0 -width 10 -hide-scrollbar -line-padding 4 -padding 20 -lines 4 -font "scientifica bold 8" <<< "i3|bottom|shades|off")"
            case "$MENU" in
                *i3) polybar-i3.sh ;;
		*bottom) polybar-bottom.sh ;;
                *shades) polybar-p11.sh ;;
		*off) pkill polybar
            esac
