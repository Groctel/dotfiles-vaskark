#!/bin/sh

#
# move window top right
#

# width of root
x=$(xwininfo -root | awk '/Width:/ { print $2 }')

# width of window
w=$(xwininfo -id "$(xdotool getactivewindow)" | awk '/Width:/ { print $2 }')

# y offset
y=0

# move
shodc geom -x $(( x - w - y )) -y "$y"