#!/bin/bash

# colours
. "$HOME"/.cache/wal/colors.sh

# berry
if [[ "$(pgrep -x berry)" ]]; then
	berry0=$(sed -n 1p ~/.cache/wal/colors | sed 's/#//')
	berry2=$(sed -n 3p ~/.cache/wal/colors | sed 's/#//')
	berryc inner_focus_color   "$berry2"
	berryc text_focus_color    "$berry0"
	berryc inner_unfocus_color "$berry0"
	berryc text_unfocus_color  "444444"
fi

# openbox
if [[ "$(pgrep -x openbox)" ]]; then
	openbox --reconfigure
fi

# dunst 
if [[ "$(pgrep -x dunst)" ]]; then
	pkill dunst
fi

# lemonbar
if [[ "$(pgrep -x lemonbar)" ]]; then
	pkill lemonbar; lemonbar-current 2>/dev/null &
fi

# glava
sed -i "s|#define COLOR @fg.*$|#define COLOR @fg:mix(""$color2""ff, ""$color10""aa, clamp(d / GRADIENT, 0, 1))|g" ~/.config/glava/bars.glsl
if [[ "$(pgrep -x glava)" ]]; then
	pkill glava; glava -d &>/dev/null &
fi