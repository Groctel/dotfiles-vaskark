#!/bin/bash

# If redshift is running, kill it to prevent multiple instances
if ps -A | grep redshift; then
	killall -q redshift
fi

# Wait until the processes have been shut down
#sleep 0.05s

# Launch
redshift -x
redshift -c ~/.config/redshift/redshift.conf &
