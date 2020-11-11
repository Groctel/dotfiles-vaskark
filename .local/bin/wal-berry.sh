#!/bin/bash

# Query ~/.cache/wal/colors for colors:
color0=$(awk 'NR==1 {print substr($1,2,7)}' ~/.cache/wal/colors)
color2=$(awk 'NR==3 {print substr($1,2,7)}' ~/.cache/wal/colors)
color7=$(awk 'NR==8 {print substr($1,2,7)}' ~/.cache/wal/colors)

# Set berry wm colors:
berryc inner_focus_color   $color2
berryc text_focus_color    $color0
berryc inner_unfocus_color $color0
berryc text_unfocus_color  $color7
