#!/bin/bash

# colors
color0=$(awk 'NR==1 {print substr($1,2,7)}' ~/.cache/wal/colors)dd
color2=$(awk 'NR==3 {print substr($1,2,7)}' ~/.cache/wal/colors)ff

# swaylock
swaylock \
-c "$color0" \
-i "~/Pictures/4492623-little-caprice-wallpapers-m.jpg" \
--font "scientifica" \
--font-size "11px" \
--text-color "$color2" \
-l \
-k

