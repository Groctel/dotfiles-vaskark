#!/usr/bin/env sh

# Terminate
killall -q picom

# Launch
picom --experimental-backends --config ~/.config/picom/picom-blur.conf >> /tmp/picom.log 2>&1 &
