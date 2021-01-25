#!/bin/sh

# Import wal colors 
. "${HOME}/.cache/wal/colors.sh"

# vars for xyw
b=5
width=$(xdotool getdisplaygeometry | awk '{print $1}')
w=$(( width-(2*b) ))

# dmenu
dmenu_run \
-p ' dmenu ' \
-fn 'scientifica-8:bold' \
-h 24 \
-nb "$color2" \
-nf "$color0" \
-sb "$color0" \
-sf "$color2" \
-x $b \
-y $b \
-w $w \

# border is n so h = h-2n
