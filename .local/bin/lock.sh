#!/bin/bash

# format colours
color0=$(awk 'NR==1 {print substr($1,2,7)}' ~/.cache/wal/colors)
color0a="${color0}dd"
color2=$(awk 'NR==3 {print substr($1,2,7)}' ~/.cache/wal/colors)
color2a="${color2}ff"

# -i /tmp/lockblur.jpg \
# --greeterpos="965:510" \

# i3lock command
i3lock \
\
-c $color0a \
\
-u \
-b \
-n \
\
--clock \
--timestr="%-I:%M %P" \
--time-font="scientifica:bold" \
--timesize=20 \
--timecolor=$color2a \
\
--datestr="" \
\
--greetertext="Locked!" \
--greeter-font="scientifica:bold" \
--greetersize=40 \
--greetercolor=$color2a \
--greeterpos="960:510" \
