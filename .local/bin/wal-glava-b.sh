#!/bin/bash

# get colors
color2=$(sed -n 3p ~/.cache/wal/colors)FF
color10=$(sed -n 11p ~/.cache/wal/colors)AA

# write chosen colors to bars
sed -i "s|#define COLOR.*$|#define COLOR @fg:mix($color2, $color10, clamp(d / GRADIENT, 0, 1))|g" ~/.config/glava/bars.glsl
sed -i "s|#define FLIP.*$|#define FLIP 0|g" ~/.config/glava/bars.glsl

# write geometry to rc.glsl
sed -i "s|#request setgeometry.*$|#request setgeometry 0 0 1920 1080|g" ~/.config/glava/rc.glsl
#sed -i "s|#request setgeometry.*$|#request setgeometry 560 0 800 1080|g" ~/.config/glava/rc.glsl

# restart glava
#if ps -A | grep glava; then
#	killall -q glava
#fi

#glava -d -a fifo &
