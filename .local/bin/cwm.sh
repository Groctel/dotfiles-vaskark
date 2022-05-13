#!/bin/sh

# start
picom --experimental-backends --config ~/.config/picom/picom.conf &
wal -R -o wal-extras.sh &
xscreensaver --no-splash &
xidle -program "/usr/local/bin/xscreensaver-command -lock" -timeout 300 &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
systemctl --user import-environment; systemctl --user restart redshift &

# wm
exec /usr/local/bin/cwm
