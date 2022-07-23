#!/bin/sh

# colors
color0=$(awk 'NR==1 {print substr($1,2,7)}' ~/.cache/wal/colors)dd
color2=$(awk 'NR==3 {print substr($1,2,7)}' ~/.cache/wal/colors)ff
color5=$(awk 'NR==6 {print substr($1,2,7)}' ~/.cache/wal/colors)ff

# i3lock
i3lock \
\
-c "$color0" \
\
-b \
-n \
-u \
\
--greeter-text="Locked!" \
--greeter-font="Rufscript" \
--greeter-size=180 \
--greeter-color="$color2" \
--greeter-pos="970:500" \
--greeter-align=0 \
\
--date-str="%a %b %d %Y" \
--date-font="scientifica:bold" \
--date-size=20 \
--date-color="$color5" \
--date-pos="970:535" \
--date-align=0 \
\
--clock \
--time-str="%-I:%M %p" \
--time-font="scientifica:bold" \
--time-size=20 \
--time-color="$color5" \
--time-pos="970:555" \
--time-align=0
