#!/bin/sh

#
# move window to bottom left
#

# root
y=$(xwininfo -root | awk '/Height:/ { print $2 }')

# window
h=$(xwininfo -id "$(xdotool getactivewindow)" | awk '/Height:/ { print $2 }')

# border
b=4

# move
xdo move -x 0 -y $(( y - h - b ))