#!/bin/sh

#
# Launch bar
#

[ "$(pgrep -x bar.sh)" ] && killall -q bar.sh
~/.config/sdorfehs/bar.sh &