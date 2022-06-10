#!/bin/sh

#
# move window to top right
#

# root
x=$(xwininfo -root | awk '/Width:/ { print $2 }')

# window
w=$(xwininfo -id "$(xdotool getactivewindow)" | awk '/Width:/ { print $2 }')

# border
b=4

# move
xdo move -x $(( x - w - b )) -y 0