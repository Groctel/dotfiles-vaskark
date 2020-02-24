#!/bin/bash
polybar-p11.sh
pulseaudio --start --log-target=syslog &
#nitrogen --restore &
wal -R &
picom.sh &
redshift.sh &
xautolock.sh &
libinput-gestures &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
