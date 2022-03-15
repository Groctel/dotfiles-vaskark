#!/bin/sh

#
# center active window
#

# center point of screen
x1=$(( $(xdotool getdisplaygeometry | awk '{print $1}') / 2 ))
y1=$(( $(xdotool getdisplaygeometry | awk '{print $2}') / 2 ))

# active window dimensions
x2=$(( $(xwininfo -id "$(xdotool getactivewindow)" |  awk '/Width:/ {print $2}') / 2 ))
y2=$(( $(xwininfo -id "$(xdotool getactivewindow)" |  awk '/Height:/ {print $2}') / 2 ))

# center
shodc geom -x $(( x1 - x2 )) -y $(( y1 - y2 ))