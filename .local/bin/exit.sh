#!/bin/bash

## Created By Aditya Shakya

MENU="$(rofi -sep "|" -dmenu -i -p 'System' -location 0 -width 10 -hide-scrollbar -line-padding 4 -padding 20 -lines 4 -font "scientifica bold 8" <<< " Lock| Logout| Reboot| Shutdown")"
            case "$MENU" in
                *Lock) betterlockscreen -l pixel ;;
                *Logout) pkill x ;;
                *Reboot) systemctl reboot ;;
                *Shutdown) systemctl -i poweroff
            esac
