#!/bin/sh

# get colors
colora=$(sed -n 4p ~/.cache/wal/colors)FF
colorb=$(sed -n 12p ~/.cache/wal/colors)AA

# write chosen colors to file
sed -i "s|#define COLOR.*$|#define COLOR @fg:mix($colora, $colorb, clamp(d / GRADIENT, 0, 1))|g" ~/.config/glava/bars.glsl
sed -i "s|#define FLIP.*$|#define FLIP 1|g" ~/.config/glava/bars.glsl

# restart glava
killall -q glava
while pgrep -u $UID -x glava >/dev/null; do sleep 0.1; done
#glava -d m bars --audio=fifo &
glava -d -m bars
