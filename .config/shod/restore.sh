#!/bin/sh

#
# restore window to original size and position after maximizing (left|right)
#

# get window size and position

# xwininfo -id "$(xdotool getactivewindow)" | awk '/-geometry/ { print $2 }'

# size (w,h)
w=$(xwininfo -id "$(xdotool getactivewindow)" | awk '/Width:/ { print $2 }')
h=$(xwininfo -id "$(xdotool getactivewindow)" | awk '/Height:/ { print $2 }')

# coordinates (x,y)
x=
y=
