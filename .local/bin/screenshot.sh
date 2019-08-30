#!/bin/sh

screenshot() {
	case $1 in
	full)
		scrot -m -d 3 -q 85 '%Y-%m-%d_%I-%M-%S_%p.png' -e 'mv $f ~/Screenshots/'
		;;
	window)
		sleep 1
		scrot -s -q 85 '%Y-%m-%d_%I-%M-%S_%p.png' -e 'mv $f ~/Screenshots/'
		;;
	*)
		;;
	esac;
}

screenshot $1
