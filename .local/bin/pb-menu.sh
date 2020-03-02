#!/bin/bash

##

MENU="$(rofi -sep "|" -dmenu -i -p 'Polybars' -location 0 -width 10 -hide-scrollbar -line-padding 4 -padding 20 -lines 5 -font "scientifica bold 8" <<< "Default|EWMH|No-EWMH|P11|Off")"
            case "$MENU" in
                *Default) polybar.sh ;;
                *EWMH) polybar-ewmh.sh ;;
                *No-EWMH) polybar-no-ewmh.sh ;;
                *P11) polybar-p11.sh ;;
		*Off) pkill polybar
            esac
