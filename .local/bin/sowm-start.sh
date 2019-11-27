#!/bin/bash
nitrogen --restore &
picom &
redshift &
dunst &
mpd &
xautolock.sh &
notify-send "Welcome back, $USER" &
