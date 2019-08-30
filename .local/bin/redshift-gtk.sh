#!/usr/bin/env sh

# Terminate
killall -q redshift
killall -q redshift-gtk

# Wait until the processes have been shut down
while pgrep -u $UID -x redshift >/dev/null; do sleep 1; done
while pgrep -u $UID -x redshift-gtk >/dev/null; do sleep 1; done

# Launch
redshift-gtk &
