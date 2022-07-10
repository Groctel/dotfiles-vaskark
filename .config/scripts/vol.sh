#!/bin/sh

#
# Volume (no %)
#

case $(uname -s) in

	Linux*)

		v=$(pactl list sinks | awk '/Volume: front-left/ { print $5 }' | sed 's/,//' | sed 's/\%//')
		;;

	FreeBSD*)
		;;

	OpenBSD*)

		v=$(( $(sndioctl -n output.level) * 100 ))
		;;

esac

echo "$v"