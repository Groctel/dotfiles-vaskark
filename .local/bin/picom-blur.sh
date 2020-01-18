#!/usr/bin/env sh

# Terminate
killall -q picom

# Launch
echo "---" | tee -a /tmp/picom.blur.log
picom --experimental-backends --config ~/.config/picom.blur.conf >> /tmp/picom.blur.log 2>&1 &
