#!/bin/bash

# polybar
POLYBAR=$(pgrep -x polybar)
if [[ "$POLYBAR" ]]; then
    killall -q polybar
    polybar -q -r -c ~/.config/berry/polybar/config-emoji main 2>/dev/null &
else
    polybar -q -r -c ~/.config/berry/polybar/config-emoji main 2>/dev/null &
fi

# berry
BERRY=$(pgrep -x berry)
if [[ "$BERRY" ]]; then
    berryc edge_gap 0 50 0 0 &
fi

# dunst
#sed -i "s|geometry = .*$|geometry = \"0x0-15+15\"|g" ~/.cache/wal/colors-dunst &
pkill dunst