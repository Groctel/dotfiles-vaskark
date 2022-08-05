#!/bin/sh

# colors
. "$XDG_CACHE_HOME"/wal/colors.sh

# offset
x=$(( $(xdotool getdisplaygeometry | awk '{print $1}') / 6 ))
y=10
w=$(( $(xdotool getdisplaygeometry | awk '{print $1}') - (2*x) ))
h=30

# start
~/.config/lemonbar/lemonbar-emoji 2>/dev/null | lemonbar \
-p \
-o 0 \
-f "-*-scientifica-bold-r-*" \
-o 1 \
-f "Emoji-8" \
-g "$w"x"$h"+"$x"+"$y" \
-B "$color0" \
-F "#555" \
-b \
-d \
| $SHELL
