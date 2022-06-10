#!/bin/sh

#
# move window to center left
#

# root
y=$(xwininfo -root | awk '/Height:/ { print $2 }')

# window
h=$(xwininfo -id "$(xdotool getactivewindow)" | awk '/Height:/ { print $2 }')

# titlebar height
b=24

# move
berryc window_move_absolute 0 $(( y/2 - h/2 - b ))