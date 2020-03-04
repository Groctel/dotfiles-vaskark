#!/usr/bin/env sh

# Terminate
killall -q picom

# Launch
picom --experimental-backends --config ~/.config/picom/picom.dk.conf >> /tmp/picom.dk.log 2>&1 &
