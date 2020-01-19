#!/usr/bin/env sh

# Terminate
killall -q picom

# Launch
picom --experimental-backends --config ~/.config/picom.conf >> /tmp/picom.log 2>&1 &
