#!/bin/bash

# autostart
pulseaudio --start --log-target=syslog &
dunst &
picom.sh &
redshift.sh &
xautolock.sh &
libinput-gestures &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
wal -R &

# relaunch sowm if the binary changes, otherwise bail
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
