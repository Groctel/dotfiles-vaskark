#!/bin/bash

dunstify \
-h string:x-canonical-private-synchronous:value "Current song:" \
-h string:mpd:value: "`mpc current -f "%title% by %artist%"`" \
-i /usr/share/icons/gnome/16x16/status/audio-volume-high.png \
-t 4000