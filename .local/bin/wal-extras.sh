#!/bin/bash

## Author:	JST
## Email:	jtrickett@gmail.com
## Purpose:	Script for additional apps for pywal	

## Get colors
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

## Berry
color00b=$(awk 'NR==1 {print substr($1,2,7)}' ~/.cache/wal/colors)
color02b=$(awk 'NR==3 {print substr($1,2,7)}' ~/.cache/wal/colors)

berryc inner_focus_color   $color02b
berryc text_focus_color    $color00b
berryc inner_unfocus_color $color00b
berryc text_unfocus_color  $color02b

## Cava
sed -i "s|gradient_color_1.*$|gradient_color_1 = '$color02'|g" ~/.config/cava/config
sed -i "s|gradient_color_2.*$|gradient_color_2 = '$color10'|g" ~/.config/cava/config

## Dunst
systemctl --user restart dunst

## GLava
color02g=$(sed -n 3p ~/.cache/wal/colors)FF # alpha
color10g=$(sed -n 11p ~/.cache/wal/colors)AA # alpha

sed -i "s|#define COLOR.*$|#define COLOR @fg:mix($color02g, $color10g, clamp(d / GRADIENT, 0, 1))|g" ~/.config/glava/bars.glsl
sed -i "s|#define FLIP.*$|#define FLIP 1|g" ~/.config/glava/bars.glsl

# Check wm to decide orientation
# if 'berry' then
#	sed -i "s|#define FLIP.*$|#define FLIP 1|g" ~/.config/glava/bars.glsl
# else
# 	sed -i "s|#define FLIP.*$|#define FLIP 0|g" ~/.config/glava/bars.glsl
# fi

killall -q glava
glava -d -a fifo &
