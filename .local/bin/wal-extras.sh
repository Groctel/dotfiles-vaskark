#!/bin/bash

# colors
. "$HOME"/.cache/wal/colors.sh

# berry
if pgrep -x berry 1>/dev/null; then
	berry0=$(sed -n 1p ~/.cache/wal/colors | sed 's/#//')
	berry2=$(sed -n 3p ~/.cache/wal/colors | sed 's/#//')
	berryc inner_focus_color   "$berry2"
	berryc text_focus_color    "$berry0"
	berryc inner_unfocus_color "$berry0"
	berryc text_unfocus_color  "444444"
fi

# openbox
if pgrep -x openbox 1>/dev/null; then
	openbox --reconfigure
fi

# dunst
if pgrep -x dunst 1>/dev/null; then
	pkill dunst 2>/dev/null
	dunst &
fi

# lemonbar
#if pgrep -x lemonbar 1>/dev/null; then
#	pkill lemonbar 2>/dev/null
#	lemonbar-current &
#fi

# cava
#sed -i "s|gradient_color_1.*$|gradient_color_1 = "\'$color2\'"|g" ~/.config/cava/config
#sed -i "s|gradient_color_2.*$|gradient_color_2 = "\'$color10\'"|g" ~/.config/cava/config

# glava
sed -i "s|#define COLOR @fg.*$|#define COLOR @fg:mix("$color2"ff, "$color10"aa, clamp(d / GRADIENT, 0, 1))|g" ~/.config/glava/bars.glsl
if pgrep -x glava 1>/dev/null; then
	pkill glava 2>/dev/null
	glava -d &
fi
