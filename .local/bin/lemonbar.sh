#!/bin/sh

# Import the colors
. "${HOME}/.cache/wal/colors.sh"

# Terminate
killall -q lemonbar

# Launch
( sleep 1s && bash lemonbar-script1.sh | lemonbar -d -o -1 -p -B "$color0" -F "$color8" -f "Iosevka Custom"-8 -f "Font Awesome 5 Free"-8 -f "Font Awesome 5 Free Solid"-8 -g 1910x26+5+5 ) &
