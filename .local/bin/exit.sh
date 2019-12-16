#!/bin/bash

## Created By Aditya Shakya

MENU="$(rofi -sep "|" -dmenu -i -p 'System' -location 0 -width 10 -hide-scrollbar -line-padding 4 -padding 20 -lines 4 -font "Iosevka Custom 10" <<< " Lock| Logout| Reboot| Shutdown")"
            case "$MENU" in
                *Lock) betterlockscreen -l pixel ;;
                *Logout) killall sowm.sh ;;
                *Reboot) systemctl reboot ;;
                *Shutdown) systemctl -i poweroff
            esac
