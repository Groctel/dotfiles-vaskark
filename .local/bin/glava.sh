#!/bin/sh

w=$(( $(xdotool getdisplaygeometry | awk '{print $1}') / 2 ))
h=$(( $(xdotool getdisplaygeometry | awk '{print $2}') ))
x=$(( $(xdotool getdisplaygeometry | awk '{print $1}') / 2 - (w/2) ))

sed -i "s|#request setgeometry.*$|#request setgeometry $x 0 $w $h|g" ~/.config/glava/rc.glsl