#!/bin/bash

# wal
. "${HOME}/.cache/wal/colors.sh"

# offset
x=200
y=10
w=$(( $(xdotool getdisplaygeometry | awk '{print $1}') - (2*x) ))
h=34

# start
lemonbar-tp.sh | lemonbar \
-p \
-o -1 \
-f "-*-scientifica-bold-r-*" \
-o 1 \
-f "Typicons-10" \
-g "$w"x"$h"+"$x"+"$y" \
-B "$color0" \
-F "#555" \
-d \
-b \
| $SHELL
