#!/bin/sh

if [ "$(pgrep -x lemonbar)" ]; then
	pkill lemonbar
else
	lemonbar-current
fi