#!/bin/bash
polybar-no-ewmh.sh
pulseaudio --start --log-target=syslog &
#nitrogen --restore &
wal -R -a 90 &
picom.sh &
redshift.sh &
xautolock.sh &
libinput-gestures &
