#!/bin/sh

# Import wal colors 
. "${HOME}/.cache/wal/colors.sh"

# dmenu
# -sf "$color15"
# -sb "$color1"
# dmenu_run -fn 'Iosevka Custom-8' -h 26 -p ' dmenu: ' -i -nb "$color0" -nf "$color15" -sb "$color4" -sf "#000000" -dim 0.5 -x 10 -y 10 -w 1900

border=5
width=$(xdotool getdisplaygeometry | awk '{print $1}')
w=$((width-(2*border)))

# dmenu2
dmenu_run \
-fn 'Iosevka Custom-8' \
-h 28 \
-p ' dmenu: ' \
-i \
-nb "$color0" \
-nf "$color3" \
-sb "$color3" \
-sf "#000000" \
-dim 0.2 \
-x $border \
-y $border \
-w $w \
