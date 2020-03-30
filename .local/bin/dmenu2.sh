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
-h 30 \
-nb "$color3" \
-nf "$color0" \
-sb "$color0" \
-sf "$color3" \
-x $b \
-y $b \
-w $w \
-dim 0.25 \
-o 0.9 \
-z \

# border is n so h = h-2n
# -o for opacity (0-1)
