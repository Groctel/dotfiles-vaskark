#!/bin/sh

# polybar
if [ "$(pgrep -x polybar)" ]; then
    polybar-msg cmd quit
    polybar -q -r -c ~/.config/polybar/config main 2>/dev/null &
else
    polybar -q -r -c ~/.config/polybar/config main 2>/dev/null &
fi
