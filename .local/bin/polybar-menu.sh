#!/bin/bash

## Polybar menu

MENU="$(rofi -sep "|" -dmenu -i -p 'Polybars' -location 0 -width 10 -hide-scrollbar -line-padding 4 -padding 20 -lines 5 -font "scientifica bold 8" <<< "main|mini|i3|restart|off")"
            case "$MENU" in
		*main) polybar-main.sh ;;
		*mini) polybar-mini.sh ;;
                *i3) polybar-i3.sh ;;
                *restart) polybar-msg cmd restart ;;
		*off) polybar-msg cmd quit ;;
            esac
