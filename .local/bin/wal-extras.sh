#!/bin/sh

## colors
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

## berry
if pgrep -x berry; then
	berry00=$(sed -n 1p ~/.cache/wal/colors | sed 's/#//')
	berry02=$(sed -n 3p ~/.cache/wal/colors | sed 's/#//')
	berryc inner_focus_color   $berry02
	berryc text_focus_color    $berry00
	berryc inner_unfocus_color $berry00
	berryc text_unfocus_color  444444
fi

## openbox
if pgrep -x openbox; then
	openbox --reconfigure
fi

## dunst
if pgrep -x dunst; then
	pkill dunst 2>/dev/null
	dunst &
fi

## lemonbar
if pgrep -x lemonbar; then
	pkill lemonbar 2>/dev/null
	lemonbar-current
fi

## cava
sed -i "s|gradient_color_1.*$|gradient_color_1 = '$color02'|g" ~/.config/cava/config
sed -i "s|gradient_color_2.*$|gradient_color_2 = '$color10'|g" ~/.config/cava/config

## glava
sed -i "s|#define COLOR @fg.*$|#define COLOR @fg:mix("$color02"ff, "$color10"aa, clamp(d / GRADIENT, 0, 1))|g" ~/.config/glava/bars.glsl
sed -i "s|#define COLOR @fg.*$|#define COLOR @fg:mix("$color02"ff, "$color10"aa, clamp(d / GRADIENT, 0, 1))|g" ~/.config/glava/radial.glsl
if pgrep -x glava; then
	pkill glava 2>/dev/null
	glava -d &
fi
