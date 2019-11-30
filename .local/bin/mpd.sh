#!/usr/bin/env sh

# Terminate already running instances
killall -q mpd

# Wait until the processes have been shut down
#while pgrep -u $UID -x mpd >/dev/null; do sleep 1; done

# Launch
mpd &
