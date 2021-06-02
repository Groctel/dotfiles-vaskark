#!/bin/bash

## Polybar menu

MENU="$(rofi -sep "|" -dmenu -i -p 'Polybars:' -location 0 -width 10 -hide-scrollbar -line-padding 4 -padding 20 -lines 6 -font "scientifica bold 8" <<< "main|mini|bspwm|-----|restart|off")"

case "$MENU" in
	*main) polybar-main.sh ;;
	*mini) polybar-mini.sh ;;
    *bspwm) polybar-bspwm.sh ;;
    *-----) ;;
    *restart) polybar-msg cmd restart ;;
	*off) polybar-msg cmd quit ;;
esac
