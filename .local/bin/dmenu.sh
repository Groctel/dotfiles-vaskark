#!/bin/bash

# Import wal colors 
#. "${HOME}/.cache/wal/colors.sh"

# xyw
x=0
y=0
w=$(( $(xdotool getdisplaygeometry | awk '{print $1}') - (2*x) ))
h=30

# dmenu
dmenu_run \
-p '  ' \
-h $h \
-x $x \
-y $y \
-z $w \
-l 0
