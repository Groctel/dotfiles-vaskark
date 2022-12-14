#!/bin/sh

#
# move window to bottom right
#

# root
x=$(xwininfo -root | awk '/Width:/ { print $2 }')
y=$(xwininfo -root | awk '/Height:/ { print $2 }')

# window
w=$(xwininfo -id "$(xdotool getactivewindow)" | awk '/Width:/ { print $2 }')
h=$(xwininfo -id "$(xdotool getactivewindow)" | awk '/Height:/ { print $2 }')

# titlebar height
b=24

# move
berryc window_move_absolute $(( x - w )) $(( y - h - b ))