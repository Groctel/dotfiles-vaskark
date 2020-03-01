#!/bin/bash

# Toggle script for polybar

if pgrep -x 'polybar' > /dev/null; then
    killall polybar
else
    polybar -r -c ~/.config/polybar/config.no-ewmh top &
fi
