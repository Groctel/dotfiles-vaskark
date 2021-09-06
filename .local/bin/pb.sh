#!/bin/bash

# polybar
if pgrep -x polybar 1>/dev/null; then
    pkill polybar 2>/dev/null
    polybar -q -r -c ~/.config/berry/polybar/config main 2>/dev/null &
else
    polybar -q -r -c ~/.config/berry/polybar/config main 2>/dev/null &
fi

# berry
berryc edge_gap 0 50 0 0 &

# dunst
#sed -i "s|geometry = .*$|geometry = \"0x0-15+15\"|g" ~/.cache/wal/colors-dunst &
pkill dunst 2>/dev/null
dunst &
