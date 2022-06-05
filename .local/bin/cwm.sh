#!/bin/sh

# start
picom --experimental-backends --config ~/.config/picom/picom.conf &
wal -R -o wal-extras.sh &
xautolock -time 10 -locker 'lock.sh' -killer 'systemctl suspend' -corners +0-0 -cornerdelay 2 &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
systemctl --user import-environment; systemctl --user restart redshift

# cwm
exec /usr/local/bin/cwm
