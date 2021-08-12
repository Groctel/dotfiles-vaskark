#!/bin/bash

# wal
. "$HOME"/.cache/wal/colors.sh

# offset
x=300
y=10
w=$(( $(xdotool getdisplaygeometry | awk '{print $1}') - (2*x) ))
h=32

# start
lemonbar-nf.sh | lemonbar \
-p \
-o -1 \
-f "-*-scientifica-bold-r-*" \
-o 1 \
-f "Symbols Nerd Font-10" \
-g "$w"x"$h"+"$x"+"$y" \
-B "$color0" \
-F "#555" \
-d \
-b \
| $SHELL

