#!/bin/bash
polybar-ewmh.sh
pulseaudio --start --log-target=syslog &
#nitrogen --restore &
wal -R &
dunst &
picom.sh &
redshift.sh &
mpd.sh &
xautolock.sh &
