#!/bin/bash

# Import wal colors 
#. "${HOME}/.cache/wal/colors.sh"

# xyw
x=0
y=0

width=$(xdotool getdisplaygeometry | awk '{print $1}')
w=$(( width-(2*x) ))

# prompts
#-p '  ' \
#-p ' ❯ ' \

# dmenu
dmenu_run \
-p '  ' \
-h 28 \
-x $x \
-y $y \
-z $w \
-l 0 \
