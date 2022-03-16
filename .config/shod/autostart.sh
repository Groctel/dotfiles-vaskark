#!/bin/sh

# sxhkd
sxhkd -c "$HOME"/.config/shod/sxhkdrc "$HOME"/.config/sxhkd/sxhkdrc.common &

# picom
picom --experimental-backends --config "$HOME"/.config/picom/picom.conf &

# redshift
systemctl --user import-environment; systemctl --user restart redshift &

# xautolock
xautolock -time 10 -locker 'lock.sh' -killer 'systemctl suspend' -corners 00-+ &

# polkit
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

# wal
wal -q -R -o wal-extras.sh

# touchegg
touchegg &

# status bar
polybar-current &

# glava
w=$(( $(xdotool getdisplaygeometry | awk '{print $1}') / 2 ))
h=$(( $(xdotool getdisplaygeometry | awk '{print $2}') ))
x=$(( $(xdotool getdisplaygeometry | awk '{print $1}') / 2 - (w/2) ))
sed -i "s|#request setgeometry.*$|#request setgeometry $x 0 $w $h|g" ~/.config/glava/rc.glsl

# wm
exec shod
