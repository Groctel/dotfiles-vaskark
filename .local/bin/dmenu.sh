#!/bin/sh

# Import wal colors 
. "${HOME}/.cache/wal/colors.sh"

# vars for xyw
b=5
width=$(xdotool getdisplaygeometry | awk '{print $1}')
w=$(( width-(2*b) ))

# dmenu
dmenu_run \
-p ' ask and ye shall find: ' \
-fn 'scientifica-11:bold' \
-h 30 \
-i \
-nb "$color3" \
-nf "$color0" \
-sb "$color0" \
-sf "$color3" \
-x $b \
-y $b \
-w $w \
-dim 0.25 \
-o 0.95
