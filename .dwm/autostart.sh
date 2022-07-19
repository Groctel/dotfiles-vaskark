#!/bin/sh

# apps
picom --experimental-backends --config ~/.config/picom/picom.conf &
bash "$HOME"/.fehbg &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
xscreensaver --no-splash &
xautolock -time 10 -locker 'xscreensaver-command -lock' -killer 'systemctl suspend' -corners +0-0 -cornerdelay 1 &
systemctl --user import-environment; systemctl --user restart redshift
glava.sh &
slstatus &