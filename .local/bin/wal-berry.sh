#!/bin/sh

# Query ~/.cache/wal/colors for colors:
color0=$(awk 'NR==1 {print substr($1,2,7)}' ~/.cache/wal/colors)
color3=$(awk 'NR==4 {print substr($1,2,7)}' ~/.cache/wal/colors)

# Set berry wm colors:
berryc inner_focus_color   $color3
berryc text_focus_color    $color0
berryc inner_unfocus_color $color0
berryc text_unfocus_color  $color3
