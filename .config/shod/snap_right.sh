#!/bin/sh

#
# snap window right
#

# half of root width
w=$(( $(xwininfo -root | awk '/Width:/ { print $2 }') / 2 )) 

# root height
h=$(xwininfo -root | awk '/Height:/ { print $2 }') 

# snap
shodc geom -w "$w" -h "$h" ; shodc geom -x "$w" -y 0
