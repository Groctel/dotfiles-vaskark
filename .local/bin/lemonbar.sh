#!/bin/sh

# Import the colors
. "${HOME}/.cache/wal/colors.sh"

( sleep 1s && bash lemonbar-stuff.sh | lemonbar -p -B "$color0" -F "$color8" -f "Monospace"-8 -f "Font Awesome 5 Free Regular"-8 -g 1910x28+5+5) &
