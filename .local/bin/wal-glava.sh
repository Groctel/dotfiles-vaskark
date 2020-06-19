#!/bin/sh

# get colors
color2=$(sed -n 3p ~/.cache/wal/colors)FF
color10=$(sed -n 11p ~/.cache/wal/colors)AA

# write chosen colors to bars
sed -i "s|#define COLOR.*$|#define COLOR @fg:mix($color2, $color10, clamp(d / GRADIENT, 0, 1))|g" ~/.config/glava/bars.glsl
sed -i "s|#define FLIP.*$|#define FLIP 1|g" ~/.config/glava/bars.glsl

# radial
sed -i "s|#define COLOR.*$|#define COLOR @fg:mix($color2, $color10, clamp(d / GRADIENT, 0, 1))|g" ~/.config/glava/radial.glsl

# restart glava
killall -q glava
while pgrep -u $UID -x glava >/dev/null; do sleep 0.1; done
glava -d m bars --audio=fifo &
#glava -d -m bars
