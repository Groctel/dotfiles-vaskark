#!/bin/bash

# statusbar
while true; do
	xsetroot -name " $( date +"%I:%M %p" ) "
	sleep 1m
done &

# autostart
pulseaudio --start --log-target=syslog &
dunst &
wal.sh &
picom.sh &
redshift.sh &
xautolock.sh &
libinput-gestures &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

# relaunch sara if binary changes, otherwise bail
# quit kb once: reloads binary
# quit kb next, quit
csum=$(sha1sum $(which sara))
new_csum=""
while true
do
    if [ "$csum" != "$new_csum" ]
    then
        csum=$new_csum
        sara
    else
        exit 0
    fi
    new_csum=$(sha1sum $(which sara))
    sleep 0.5
done
