#!/bin/bash

## Polybar menu

MENU="$(rofi -sep "|" -dmenu -i -p 'Polybars' -location 0 -width 10 -hide-scrollbar -line-padding 4 -padding 20 -lines 6 -font "scientifica bold 8" <<< "i3|big|small|bottom|shades|off")"
            case "$MENU" in
                *i3) polybar-main-i3.sh ;;
		*big) polybar-main-big.sh ;;
		*small) polybar-main-small.sh ;;
		*bottom) polybar-main-small-bottom.sh ;;
                *shades) polybar-p11.sh ;;
		*off) pkill polybar
            esac
