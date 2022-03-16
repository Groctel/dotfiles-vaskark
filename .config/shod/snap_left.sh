#!/bin/sh

#
# snap window left
#

# half of root width
w=$(( $(xwininfo -root | awk '/Width:/ { print $2 }') / 2 )) 

# root height
h=$(xwininfo -root | awk '/Height:/ { print $2 }') 

# snap
shodc geom -w "$w" -h "$h" ; shodc geom -x 0 -y 0
