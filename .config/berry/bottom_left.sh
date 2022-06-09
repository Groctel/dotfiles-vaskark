#!/bin/sh

#
# move window to bottom left
#

# height of root
y=$(xwininfo -root | awk '/Height:/ { print $2 }')

# height of window
h=$(xwininfo -id "$(xdotool getactivewindow)" | awk '/Height:/ { print $2 }')

# move
berryc window_move_absolute 0 $(( y - h - 24 ))