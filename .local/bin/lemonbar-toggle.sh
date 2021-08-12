#!/bin/bash

# Toggle lemonbar

xdotool search -class Bar &>/dev/null && (pgrep -x "lemonbar" | grep -v grep | awk '{print $1}' | xargs kill) || lemonbar-current &
