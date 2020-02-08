#!/bin/sh

# Import wal colors 
. "${HOME}/.cache/wal/colors.sh"

# vars
b=5
width=$(xdotool getdisplaygeometry | awk '{print $1}')
w=$(( width-(2*b) ))

# dmenu2
dmenu_run \
-fn 'Iosevka Custom-8' \
-h 28 \
-p ' dmenu: ' \
-i \
-nb "$color0" \
-nf "$color3" \
-sb "$color3" \
-sf "#000000" \
-dim 0.2 \
-x $b \
-y $b \
-w $w \
