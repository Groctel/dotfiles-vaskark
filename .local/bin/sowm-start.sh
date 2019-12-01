#!/bin/bash
#polybar-no-ewmh.sh
pulseaudio --start --log-target=syslog &
nitrogen --restore &
dunst &
picom.sh &
redshift.sh &
mpd.sh &
xautolock.sh &
