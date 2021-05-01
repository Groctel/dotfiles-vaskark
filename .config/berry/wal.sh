#!/bin/sh

# colors
berry00=$(awk 'NR==1 {print substr($1,2,7)}' ~/.cache/wal/colors)
berry02=$(awk 'NR==3 {print substr($1,2,7)}' ~/.cache/wal/colors)

berryc inner_focus_color   $berry02
berryc text_focus_color    $berry00
berryc inner_unfocus_color $berry00
berryc text_unfocus_color  444444