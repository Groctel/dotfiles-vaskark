#!/bin/bash

# Terminate
killall -9 kunst

# Wait until the processes have been shut down
while pgrep -u $UID -x kunst >/dev/null; do sleep 1; done

# Launch
kunst --size 300x300 --position +100+100 &
