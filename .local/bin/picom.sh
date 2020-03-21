#!/usr/bin/env sh

# Terminate
killall -q picom

# Wait until the processes have been shut down
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done

# Launch
picom --experimental-backends --config ~/.config/picom/picom.conf >> /tmp/picom.log 2>&1 &
