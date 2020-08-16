#!/bin/bash

#      _                 _                 _ 
#   __| |_   _ _ __  ___| |___      ____ _| |
#  / _` | | | | '_ \/ __| __\ \ /\ / / _` | |
# | (_| | |_| | | | \__ \ |_ \ V  V / (_| | |
#  \__,_|\__,_|_| |_|___/\__| \_/\_/ \__,_|_|
# Author: Kwest Ambani
# Created: 02.08.19

# get pywal colors
color00=$(sed -n 1p ~/.cache/wal/colors)
color01=$(sed -n 2p ~/.cache/wal/colors)
color02=$(sed -n 3p ~/.cache/wal/colors)
color03=$(sed -n 4p ~/.cache/wal/colors)
color04=$(sed -n 5p ~/.cache/wal/colors)
color05=$(sed -n 6p ~/.cache/wal/colors)
color06=$(sed -n 7p ~/.cache/wal/colors)
color07=$(sed -n 8p ~/.cache/wal/colors)
color08=$(sed -n 9p ~/.cache/wal/colors)
color09=$(sed -n 10p ~/.cache/wal/colors)
color10=$(sed -n 11p ~/.cache/wal/colors)
color11=$(sed -n 12p ~/.cache/wal/colors)
color12=$(sed -n 13p ~/.cache/wal/colors)
color13=$(sed -n 14p ~/.cache/wal/colors)
color14=$(sed -n 15p ~/.cache/wal/colors)
color15=$(sed -n 16p ~/.cache/wal/colors)

# inject pywal colors into dunst config
sed -i "s/background = .*/background = \"$color02\"/g" ~/.config/dunst/dunstrc
sed -i "s/foreground = .*/foreground = \"$color00\"/g" ~/.config/dunst/dunstrc
sed -i "s/frame_color = .*/frame_color = \"$color02\"/g" ~/.config/dunst/dunstrc

pkill dunst
dunst &
