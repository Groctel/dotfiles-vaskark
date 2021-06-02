#!/bin/bash

# wal
. "${HOME}/.cache/wal/colors.sh"

# offset
x=0
y=0
w=$(( $(xdotool getdisplaygeometry | awk '{print $1}') - (2*x) ))
h=30

# start
lemonbar.sh | lemonbar -p \
-f "-*-siji-*" \
-f "-*-scientifica-bold-r-*" \
-g "$w"x"$h"+"$x"+"$y" \
-B "$color0" \
-F "#555" \
-d \
| $SHELL
