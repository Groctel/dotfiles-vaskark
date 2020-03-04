#!/usr/bin/env sh

# Terminate
killall -q picom

# Launch
picom --experimental-backends --config ~/.config/picom/config >> /tmp/picom.log 2>&1 &
