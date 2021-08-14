#!/bin/bash

# colors
color0=$(awk 'NR==1 {print substr($1,2,7)}' ~/.cache/wal/colors)dd
color2=$(awk 'NR==3 {print substr($1,2,7)}' ~/.cache/wal/colors)ff

# i3lock
i3lock \
\
-c "$color0" \
\
-b \
-n \
-u \
\
--clock \
--time-str="%-I:%M %P" \
--time-font="scientifica:bold" \
--time-size=20 \
--time-color="$color2" \
\
--date-str="" \
\
--greeter-text="Locked!" \
--greeter-font="scientifica:bold" \
--greeter-size=60 \
--greeter-color="$color2" \
--greeter-pos="960:510"
