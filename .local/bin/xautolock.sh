#!/bin/sh

# Terminate
if [ "$(pgrep -x xautolock)" ]; then
	killall -q xautolock
fi

# Wait until the processes have been shut down
while pgrep -x xautolock >/dev/null; do sleep 0.05; done

# Launch
#xautolock -time 10 -locker 'betterlockscreen -l pixel' -corners 00-+
xautolock -time 10 -locker 'lock.sh' -killer 'systemctl suspend' -corners 00-+ &
