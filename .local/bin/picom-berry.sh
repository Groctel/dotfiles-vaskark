#!/bin/bash

# If picom is running, kill it to prevent multiple instances
if ps -A | grep picom; then
	killall -9 picom
fi

# Wait until the processes have been shut down
sleep 0.1s

# Launch
picom --experimental-backends --config ~/.config/berry/picom.conf >> /tmp/picom.log 2>&1 &