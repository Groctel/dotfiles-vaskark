#!/bin/sh

#
# center window
#

# root window center
x=$(( $(xwininfo -root | awk '/Width:/ { print $2 }') / 2 ))
y=$(( $(xwininfo -root | awk '/Height:/ { print $2 }') / 2 ))

# active window (w,h)
w=$(( $(xwininfo -id "$(xdotool getactivewindow)" |  awk '/Width:/ {print $2}') / 2 ))
h=$(( $(xwininfo -id "$(xdotool getactivewindow)" |  awk '/Height:/ {print $2}') / 2 ))

# center
shodc geom -x $(( x - w )) -y $(( y - h ))
