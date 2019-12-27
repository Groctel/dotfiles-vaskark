#!/bin/sh

# Import the colors
. "${HOME}/.cache/wal/colors.sh"

# Terminate
killall -q lemonbar
#killall -q lemonbar.sh
#killall -q lemonbar-script1.sh

# Wait until the processes have been shut down
while pgrep -u $UID -x lemonbar >/dev/null; do sleep 0.1; done
while pgrep -u $UID -x lemonbar.sh >/dev/null; do sleep 0.1; done
while pgrep -u $UID -x lemonbar-script1.sh >/dev/null; do sleep 0.1; done

# Launch
( sleep 1s && bash lemonbar-script1.sh | lemonbar -d -o -1 -p -B "$color0" -F "$color3" -f "Iosevka Custom"-8 -f "Material Icons"-10 -g 1910x28+5+5 ) &
