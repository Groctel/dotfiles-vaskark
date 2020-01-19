#!/usr/bin/env sh

# Terminate
killall -q picom

# Launch
picom --experimental-backends --config ~/.config/picom.blur.conf >> /tmp/picom.blur.log 2>&1 &
