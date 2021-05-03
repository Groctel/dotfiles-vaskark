#!/bin/sh

# Import wal colors 
#. "${HOME}/.cache/wal/colors.sh"

# vars for xyw
b=0
width=$(xdotool getdisplaygeometry | awk '{print $1}')
w=$(( width-(2*b) ))

# dmenu
dmenu_run \
-p ' dmenu ' \
-h 30 \
-x $b \
-y $b \
-w $w \