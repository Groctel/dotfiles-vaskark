#!/bin/bash

# polybar
POLYBAR=$(pgrep -x polybar)
if [[ -n "$POLYBAR" ]]; then
    pkill polybar
    polybar -q -r -c ~/.config/berry/polybar/config-nf main 2>/dev/null &
else
    polybar -q -r -c ~/.config/berry/polybar/config-nf main 2>/dev/null &
fi

# berry
berryc edge_gap 0 50 0 0 &

# dunst
#sed -i "s|geometry = .*$|geometry = \"0x0-15+15\"|g" ~/.cache/wal/colors-dunst &
pkill dunst; dunst &