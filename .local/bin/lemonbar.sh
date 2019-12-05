#!/bin/sh

# Import the colors
. "${HOME}/.cache/wal/colors.sh"

( sleep 1s && bash lemonbar-script1.sh | lemonbar -p -B "$color0" -F "$color8" -f Hermit-8 -f "Font Awesome 5 Free Regular"-8 -g 1910x26+5+5) &
