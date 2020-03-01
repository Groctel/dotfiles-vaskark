#!/bin/sh

# Import wal colors 
. "${HOME}/.cache/wal/colors.sh"

# vars for xyw
b=5
width=$(xdotool getdisplaygeometry | awk '{print $1}')
w=$(( width-(2*b) ))

# dmenu
dmenu_run \
-p ' dmenu: ' \
-fn 'scientifica-11:bold' \
-h 30 \
-i \
-q \
-nb "$color0" \
-nf "$color3" \
-sb "$color3" \
-sf "#000000" \
-x $b \
-y $b \
-w $w \
-dim 0.2 \
-o 0.95
