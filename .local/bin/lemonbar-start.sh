#!/bin/bash

# wal
. "${HOME}/.cache/wal/colors.sh"

# offset
x=0
y=0
w=$(( $(xdotool getdisplaygeometry | awk '{print $1}') - (2*x) ))
h=28

# start
lemonbar.sh | lemonbar \
-p \
-f "-*-scientifica-bold-r-*" \
-f "-*-siji-*" \
-g "$w"x"$h"+"$x"+"$y" \
-B "$color0" \
-F "#555" \
-d \
| $SHELL
