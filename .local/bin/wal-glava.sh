#!/bin/sh
color=$(sed -n 4p ~/.cache/wal/colors)
sed -i "s|#define COLOR.*$|#define COLOR ("$color" * ((d / 800) + 1))|g" ~/.config/glava/bars.glsl


killall -q glava
while pgrep -u $UID -x glava >/dev/null; do sleep 1; done
glava --desktop --audio=fifo &
