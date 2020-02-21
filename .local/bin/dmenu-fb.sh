#!/bin/sh

# vars
b=5
width=$(xdotool getdisplaygeometry | awk '{print $1}')
w=$(( width-(2*b) ))

# dmenu2
dmenu_run \
-fn 'Iosevka Custom-8' \
-h 30 \
-p ' dmenu: ' \
-i \
-nb "#ffffff" \
-nf "#000000" \
-sb "#E6804E" \
-sf "#000000" \
-dim 0.2 \
-x $b \
-y $b \
-w $w \
