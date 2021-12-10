#!/bin/bash

# colors
. "$HOME"/.cache/wal/colors.sh

# berry
BERRY=$(pgrep -x berry)
if [[ -n "$BERRY" ]]; then
	berry0=$(sed -n 1p ~/.cache/wal/colors | sed 's/#//')
	berry2=$(sed -n 3p ~/.cache/wal/colors | sed 's/#//')
	berryc inner_focus_color   "$berry2"
	berryc text_focus_color    "$berry0"
	berryc inner_unfocus_color "$berry0"
	berryc text_unfocus_color  "444444"
fi

# openbox
OPENBOX=$(pgrep -x openbox)
if [[ -n "$OPENBOX" ]]; then
	openbox --reconfigure
fi

# dunst 
DUNST=$(pgrep -x dunst)
if [[ "$DUNST" ]]; then
	pkill dunst
fi

# lemonbar
LEMONBAR=$(pgrep -x lemonbar)
if [[ -n "$LEMONBAR" ]]; then
	pkill lemonbar; lemonbar-current &
fi

# cava
#sed -i "s|gradient_color_1.*$|gradient_color_1 = "\'$color2\'"|g" ~/.config/cava/config
#sed -i "s|gradient_color_2.*$|gradient_color_2 = "\'$color10\'"|g" ~/.config/cava/config

# glava
sed -i "s|#define COLOR @fg.*$|#define COLOR @fg:mix("$color2"ff, "$color10"aa, clamp(d / GRADIENT, 0, 1))|g" ~/.config/glava/bars.glsl
GLAVA=$(pgrep -x glava)
if [[ -n "$GLAVA" ]]; then
	pkill glava; glava -d &
fi
