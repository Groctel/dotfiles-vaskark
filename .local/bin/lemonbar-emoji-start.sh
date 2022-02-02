#!/bin/bash

# colours
. "$HOME"/.cache/wal/colors.sh

# offset
x=300
y=10
w=$(( $(xdotool getdisplaygeometry | awk '{print $1}') - (2*x) ))
h=30

# start
lemonbar-emoji.sh 2>/dev/null | lemonbar \
-p \
-o 0 \
-f "-*-scientifica-bold-r-*" \
-o 1 \
-f "Apple Color Emoji-8" \
-g "$w"x"$h"+"$x"+"$y" \
-B "$color0" \
-F "#555" \
-d \
-b \
| $SHELL