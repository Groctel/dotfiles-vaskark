#!/bin/sh

# polybar
if [ "$(pgrep -x polybar)" ]; then
    pkill polybar
    polybar -q -r -c ~/.config/polybar/config-emoji 2>/dev/null &
else
    polybar -q -r -c ~/.config/polybar/config-emoji 2>/dev/null &
fi