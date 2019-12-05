#!/bin/sh

# Import wal colors 
. "${HOME}/.cache/wal/colors.sh"

# -sf "$color15"
# -sb "$color1"
 dmenu_run -fn 'Iosevka Custom-8' -h 26 -p ' dmenu >> ' -i -nb "$color0" -nf "$color15" -sb "$color1" -sf "#000"
