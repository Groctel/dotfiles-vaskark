#!/bin/bash

# format colours
color0=$(awk 'NR==1 {print substr($1,2,7)}' ~/.cache/wal/colors)
color0a="${color0}dd"
color3=$(awk 'NR==4 {print substr($1,2,7)}' ~/.cache/wal/colors)
color3a="${color3}ff"

# -i /tmp/lockblur.jpg \
# --greeterpos="965:510" \

# i3lock command
i3lock \
\
-c $color0a \
\
-u \
-b \
\
--clock \
--timestr="%-I:%M %P" \
--time-font="scientifica:bold" \
--timesize=20 \
--timecolor=$color3a \
\
--datestr="" \
\
--greetertext="Locked!" \
--greeter-font="scientifica:bold" \
--greetersize=40 \
--greetercolor=$color3a \
--greeterpos="960:510" \
