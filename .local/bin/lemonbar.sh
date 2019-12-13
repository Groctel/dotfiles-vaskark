#!/bin/sh

# Import the colors
. "${HOME}/.cache/wal/colors.sh"

# Terminate
killall -q lemonbar

# Launch
#( sleep 1s && bash lemonbar-script1.sh | lemonbar -d -o -1 -p -B "$color0" -F "$color8" -f "Iosevka Custom"-8 -f "Material Icons"-12 -g 1910x28+5+5 ) &

( sleep 1s && bash lemonbar-script1.sh | lemonbar -d -o -1 -p -B "#aa2d211d" -F "$color3" -f "Iosevka Custom"-8 -f "Material Icons"-10 -g 1910x28+5+5 ) &
