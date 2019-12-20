#!/bin/bash
polybar-no-ewmh.sh
pulseaudio --start --log-target=syslog &
#nitrogen --restore &
wal -R &
dunst &
picom.sh &
redshift.sh &
xautolock.sh &
libinput-gestures &
