#!/bin/sh

#
# move window to center
# req: xdo
#

# root
x=$(xwininfo -root | awk '/Width:/ { print $2 }')
y=$(xwininfo -root | awk '/Height:/ { print $2 }')

# window
w=$(xwininfo -id "$(xdotool getactivewindow)" | awk '/Width:/ { print $2 }')
h=$(xwininfo -id "$(xdotool getactivewindow)" | awk '/Height:/ { print $2 }')

# move
xdo move -x $(( x/2 - w/2 )) -y $(( y/2 - h/2 ))
