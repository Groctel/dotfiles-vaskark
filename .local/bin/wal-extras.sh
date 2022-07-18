#!/bin/sh

# colours
. "$HOME"/.cache/wal/colors.sh

# berry
if [ "$(pgrep -x berry)" ]; then
	berryc inner_focus_color   "$(echo "$color2" | sed 's/#//')"
	berryc text_focus_color    "000000"
	berryc inner_unfocus_color "$(echo "$color0" | sed 's/#//')"
	berryc text_unfocus_color  "444444"
fi

# openbox
[ "$(pgrep -x openbox)" ] && openbox --reconfigure

# sdorfehs
if [ "$(pgrep -x sdorfehs)" ]; then
        sdorfehs -c "set barbordercolor #444"
        sdorfehs -c "set bgcolor $color0"
        sdorfehs -c "set fgcolor $color2"
        sdorfehs -c "set bwcolor #444"
        sdorfehs -c "set fwcolor $color2"
fi

# hypr
if [ "$(pgrep -x Hypr)" ]; then
	hypr2=$(echo "$color2" | sed 's/#//')
	sed -i "s|col.active_border.*$|col.active_border=0x77""$hypr2""|g" ~/.config/hypr/hypr.conf
fi

# cwm
[ "$(pgrep -x cwm)" ] && pkill -SIGHUP cwm

# dwm
[ "$(pgrep -x dwm)" ] && pkill -SIGHUP dwm

# dk
if [ "$(pgrep -x dk)" ]; then
	dkcmd set border colour focus = "$color2"
	dkcmd set border colour unfocus = #444444
	dkcmd set border colour urgent = "$color1"
fi

# dunst 
[ "$(pgrep -x dunst)" ] && pkill dunst

# lemonbar
[ "$(pgrep -x lemonbar)" ] && pkill lemonbar && lemonbar-current &

# glava
sed -i "s|#define COLOR @fg.*$|#define COLOR @fg:mix(""$color5""ff, ""$color13""aa, clamp(d / GRADIENT, 0, 1))|g" ~/.config/glava/bars.glsl
[ "$(pgrep -x glava)" ] && pkill -USR1 glava &

# cava
sed -i "s|gradient_color_1.*$|gradient_color_1 = \'""$color5""\'|g" ~/.config/cava/config
sed -i "s|gradient_color_2.*$|gradient_color_2 = \'""$color13""\'|g" ~/.config/cava/config
[ "$(pgrep -x cava)" ] && pkill -USR1 cava
