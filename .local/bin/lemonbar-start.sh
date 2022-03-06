#!/bin/sh

# colours
. "$HOME"/.cache/wal/colors.sh

# offset
x=300
y=10
w=$(( $(xdotool getdisplaygeometry | awk '{print $1}') - (2*x) ))
h=30

# start
lemonbar.sh 2>/dev/null | lemonbar \
-p \
-o 1 \
-f "-*-scientifica-bold-r-*" \
-o 1 \
-f "-*-siji-*" \
-g "$w"x"$h"+"$x"+"$y" \
-B "$color0" \
-F "#555" \
-d \
-b \
| $SHELL &
