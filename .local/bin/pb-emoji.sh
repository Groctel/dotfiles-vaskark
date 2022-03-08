#!/bin/sh

# polybar
if [ "$(pgrep -x polybar)" ]; then
    pkill -x polybar
    polybar -q -r -c ~/.config/polybar/config-emoji main 2>/dev/null &
else
    polybar -q -r -c ~/.config/polybar/config-emoji main 2>/dev/null &
fi