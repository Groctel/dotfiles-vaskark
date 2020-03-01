#!/bin/bash

# statusbar
while true; do
	xsetroot -name " $( date +"%I:%M %p" ) "
	sleep 1m
done &

# autostart
pulseaudio --start --log-target=syslog &
dunst &
#picom.sh &
redshift.sh &
xautolock.sh &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
wal.sh &

# map Alt_R to Mod4 for convenience
xmodmap -e "keycode 108 = Super_L" 
xmodmap -e "remove mod1 = Super_L"

# relaunch DWM if the binary changes, otherwise bail
csum=$(sha1sum $(which dwm))
new_csum=""
while true
do
    if [ "$csum" != "$new_csum" ]
    then
        csum=$new_csum
        dwm
    else
        exit 0
    fi
    new_csum=$(sha1sum $(which dwm))
    sleep 0.5
done

#while true; do
#	# Log sterror to a file
#	dwm 2> ~/.dwm/log
#	# No error logging
#	# dwm >/dev/null 2>&1
#done
