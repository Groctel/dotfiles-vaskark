#!/bin/bash
nitrogen --restore &
picom &
redshift &
dunst &
notify-send "Welcome back, $USER" &
