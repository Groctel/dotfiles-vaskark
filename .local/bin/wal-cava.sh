#!/bin/sh

# get colors
color2=$(sed -n 3p ~/.cache/wal/colors)
color10=$(sed -n 11p ~/.cache/wal/colors)

sed -i "s|gradient_color_1.*$|gradient_color_1 = '$color2'|g" ~/.config/cava/config
sed -i "s|gradient_color_2.*$|gradient_color_2 = '$color10'|g" ~/.config/cava/config
