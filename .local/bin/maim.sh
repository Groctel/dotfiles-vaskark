#!/bin/sh

screenshot() {
	case $1 in
	full)
		maim -m 2 -d 3 -B -q ~/Screenshots/$(date +%Y-%m-%d_%I-%M-%S_%p).png
		;;
	select)
		sleep 1
		maim -s -m 2 -B -q ~/Screenshots/$(date +%Y-%m-%d_%I-%M-%S_%p).png
		;;
	*)
		;;
	esac;
}

screenshot $1
