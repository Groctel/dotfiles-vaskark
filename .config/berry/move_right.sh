#!/bin/sh

#
# move window to top right
#

# width of root
x=$(xwininfo -root | awk '/Width:/ { print $2 }')

# width of window
w=$(xwininfo -id "$(xdotool getactivewindow)" | awk '/Width:/ { print $2 }')

# move
berryc window_move_absolute $(( x - w )) 0