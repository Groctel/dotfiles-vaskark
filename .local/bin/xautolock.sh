#!/usr/bin/env sh

# Terminate
killall -q xautolock

# Wait until the processes have been shut down
while pgrep -u $UID -x xautolock >/dev/null; do sleep 1; done

# Launch
#xautolock -time 10 -locker 'betterlockscreen -l pixel' -corners 00-+
xautolock -time 10 -locker 'lock.sh' -corners 00-+
