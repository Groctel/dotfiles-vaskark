#!/bin/sh

# colours
. "$HOME"/.cache/wal/colors.sh

# openbox
openbox --reconfigure

# dunst 
[ "$(pgrep -x dunst)" ] && pkill dunst

# glava
sed -i "s|#define COLOR @fg.*$|#define COLOR @fg:mix(""$color5""ff, ""$color13""aa, clamp(d / GRADIENT, 0, 1))|g" ~/.config/glava/bars.glsl
[ "$(pgrep -x glava)" ] && pkill glava && glava -d 2>/dev/null &

# cava
sed -i "s|gradient_color_1.*$|gradient_color_1 = \'""$color5""\'|g" ~/.config/cava/config
sed -i "s|gradient_color_2.*$|gradient_color_2 = \'""$color13""\'|g" ~/.config/cava/config
[ "$(pgrep -x cava)" ] && pkill -USR2 cava
