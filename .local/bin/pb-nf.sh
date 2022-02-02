#!/bin/bash

# polybar
POLYBAR=$(pgrep -x polybar)
if [[ "$POLYBAR" ]]; then
    killall -q polybar
    polybar -q -r -c ~/.config/berry/polybar/config-nf main 2>/dev/null &
else
    polybar -q -r -c ~/.config/berry/polybar/config-nf main 2>/dev/null &
fi