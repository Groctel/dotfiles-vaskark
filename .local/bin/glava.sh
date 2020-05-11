#!/bin/sh

# Terminate
killall -q glava

# Wait until the processes have been shut down
while pgrep -u $UID -x glava >/dev/null; do sleep 1; done

# Launch
glava -d -m bars &
