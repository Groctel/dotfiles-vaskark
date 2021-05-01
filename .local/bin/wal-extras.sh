#!/bin/sh

# colors
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

## dunst
systemctl --user restart dunst

## cava
sed -i "s|gradient_color_1.*$|gradient_color_1 = '$color02'|g" ~/.config/cava/config
sed -i "s|gradient_color_2.*$|gradient_color_2 = '$color10'|g" ~/.config/cava/config

## glava
#glava1=$(sed -n 9p ~/.cache/wal/colors)FF
#glava2=$(sed -n 3p ~/.cache/wal/colors)FF

#sed -i "s|#define COLOR.*$|#define COLOR @fg:mix($glava1, $glava2, clamp(d / GRADIENT, 0, 1))|g" ~/.config/glava/bars.glsl
#sed -i "s|#define FLIP.*$|#define FLIP 1|g" ~/.config/glava/bars.glsl

#if ps -A | grep glava; then
#		killall -9 glava 2>/dev/null
#		glava -d
#	else
#		killall -9 glava 2>/dev/null
#fi

## openbox
openbox --reconfigure
