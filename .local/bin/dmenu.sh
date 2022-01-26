#!/bin/bash

# xyw
x=2
y=2
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
