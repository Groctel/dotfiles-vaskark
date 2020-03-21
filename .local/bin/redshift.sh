#!/usr/bin/env sh

# Terminate
killall -q redshift

# Wait until the processes have been shut down
while pgrep -u $UID -x redshift >/dev/null; do sleep 1; done

# Launch
redshift -c ~/.config/redshift/redshift.conf &
