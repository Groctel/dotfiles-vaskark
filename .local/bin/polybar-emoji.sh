#!/bin/sh

# polybar
if [ "$(pgrep -x polybar)" ]; then
    polybar-msg cmd quit
    polybar -r -c ~/.config/polybar/config-emoji.ini 2>/dev/null &
else
    polybar -r -c ~/.config/polybar/config-emoji.ini 2>/dev/null &
fi