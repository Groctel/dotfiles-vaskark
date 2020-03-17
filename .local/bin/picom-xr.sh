#!/usr/bin/env sh

# Terminate
killall -q picom

# Launch
picom --config ~/.config/picom/picom-xr.conf >> /tmp/picom.log 2>&1 &
