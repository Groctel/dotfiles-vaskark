#!/bin/bash

## Polybar menu

MENU="$(rofi -sep "|" -dmenu -i -p 'Polybars' -location 0 -width 10 -hide-scrollbar -line-padding 4 -padding 20 -lines 5 -font "scientifica bold 8" <<< "Default|Colors|OFF")"
            case "$MENU" in
                *Default) polybar.sh ;;
                *Colors) polybar-p11.sh ;;
		*OFF) pkill polybar
            esac
