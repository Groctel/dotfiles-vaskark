#!/bin/sh

if [ $(pgrep -x openbox) ]; then
	w=$(( $(xdotool getdisplaygeometry | awk '{print $1}') / 1 ))
else
	w=$(( $(xdotool getdisplaygeometry | awk '{print $1}') / 2 ))
fi

h=$(( $(xdotool getdisplaygeometry | awk '{print $2}') ))
x=$(( $(xdotool getdisplaygeometry | awk '{print $1}') / 2 - (w/2) ))

sed -i "s|#request setgeometry.*$|#request setgeometry $x 0 $w $h|g" ~/.config/glava/rc.glsl