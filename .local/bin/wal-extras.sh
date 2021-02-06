#!/bin/sh

# get pywal colors
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
berry00=$(awk 'NR==1 {print substr($1,2,7)}' ~/.cache/wal/colors)
berry02=$(awk 'NR==3 {print substr($1,2,7)}' ~/.cache/wal/colors)

berryc inner_focus_color   $berry02
berryc text_focus_color    $berry00
berryc inner_unfocus_color $berry00
berryc text_unfocus_color  444444

## dunst
systemctl --user restart dunst

## cava
sed -i "s|gradient_color_1.*$|gradient_color_1 = '$color02'|g" ~/.config/cava/config
sed -i "s|gradient_color_2.*$|gradient_color_2 = '$color10'|g" ~/.config/cava/config

## glava
glava_dark=$(sed -n 3p ~/.cache/wal/colors)FF
glava_light=$(sed -n 11p ~/.cache/wal/colors)AA

sed -i "s|#define COLOR.*$|#define COLOR @fg:mix($glava_dark, $glava_light, clamp(d / GRADIENT, 0, 1))|g" ~/.config/glava/bars.glsl
#sed -i "s|#define FLIP.*$|#define FLIP 1|g" ~/.config/glava/bars.glsl

if ps -A | grep glava; then
	killall -9 glava
        glava -d
    else
        killall -9 glava
fi

## openbox
openbox --reconfigure

## simplewm
sed -i "s|border_colour.*$|border_colour = $color02 $color08 $color01 $color04 $color06|g" ~/.config/simplewm/configrc

## xss
#pkill xscreensaver
#xscreensaver &
