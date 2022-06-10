#!/bin/sh

#
# move window to center top
#

# root
x=$(xwininfo -root | awk '/Width:/ { print $2 }')

# window
w=$(xwininfo -id "$(xdotool getactivewindow)" | awk '/Width:/ { print $2 }')

# move
berryc window_move_absolute $(( x/2 - w/2 )) 0