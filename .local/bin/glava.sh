#!/bin/sh

# ratio of horizontal res for length of bar (half=2, etc)
wb=2

w=$(( $(xdotool getdisplaygeometry | awk '{print $1}') / wb ))
h=$(( $(xdotool getdisplaygeometry | awk '{print $2}') ))
x=$(( $(xdotool getdisplaygeometry | awk '{print $1}') / 2 - (w/2) ))
y=0

# echo $x $y $w $y

sed -i "s|#request setgeometry.*$|#request setgeometry $x $y $w $h|g" ~/.config/glava/rc.glsl