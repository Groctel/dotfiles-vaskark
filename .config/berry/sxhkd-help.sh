#!/bin/bash

awk '/^[a-z]/ && last {print $0,"\t",last} {last=""} /^#/{last=$0}' ~/.config/berry/sxhkdrc ~/.config/sxhkd/sxhkdrc.common |
    column -t -s $'\t' |
    rofi -dmenu -i -markup-rows -no-show-icons -width 400 -lines 15 -yoffset 40 -p 'help'
