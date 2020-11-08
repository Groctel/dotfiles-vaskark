#!/bin/bash

## autostart
# polybar-main.sh &
# dunst &
picom --experimental-backends --config ~/.config/picom/picom.conf &
redshift.sh &
xautolock.sh &
libinput-gestures &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
wal -R -o wal-berry.sh -o wal-dunst.sh &
xclickroot -r xmenu.sh &

## relaunch sowm if the binary changes, otherwise bail
csum=$(sha1sum $(which sowm))
new_csum=""
while true
do
    if [ "$csum" != "$new_csum" ]
    then
        csum=$new_csum
        sowm
    else
        exit 0
    fi
    new_csum=$(sha1sum $(which sowm))
    sleep 0.5
done
