#!/bin/sh

# colors
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

# offset
x=0
y=0

# width of desktop
width=$(xdotool getdisplaygeometry | awk '{print $1}')
w=$(( width-(2*x) ))

# height
h=24

# load
lemonbar.sh \
| lemonbar -p \
-f "scientifica-7.5" \
-f "siji-7.5" \
-g "$w"x"$h"+"$x"+"$y" \
-B "$color00" \
-F "#555555" \
