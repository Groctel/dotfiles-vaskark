#!/bin/sh

# misc
sxhkd -c "$HOME"/.config/shod/sxhkdrc "$HOME"/.config/sxhkd/sxhkdrc.common &
picom --experimental-backends --config "$HOME"/.config/picom/picom.conf &
systemctl --user import-environment; systemctl --user restart redshift &
xautolock -time 10 -locker 'lock.sh' -killer 'systemctl suspend' -corners 00-+ &
wal -q -R -o wal-extras.sh
touchegg.sh
polybar-current &

# glava
w=$(( $(xdotool getdisplaygeometry | awk '{print $1}') / 2 ))
h=$(( $(xdotool getdisplaygeometry | awk '{print $2}') ))
x=$(( $(xdotool getdisplaygeometry | awk '{print $1}') / 2 - (w/2) ))
sed -i "s|#request setgeometry.*$|#request setgeometry $x 0 $w $h|g" ~/.config/glava/rc.glsl

# wm
exec shod
