#!/bin/zsh

# Terminate already running bar instances
killall -9 polybar
# polybar-msg cmd quit


# Launch
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar -r -c $HOME/.config/polybar/config top >>/tmp/polybar1.log 2>&1 &
polybar -r -c $HOME/.config/polybar/config bottom >>/tmp/polybar2.log 2>&1 &

#echo "Bars launched..."
