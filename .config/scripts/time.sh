#!/bin/sh

# current system time

case $(uname -s) in

	Linux*)
		t=$(date +"%-I:%M %p")
		;;

	FreeBSD*)
		t=$(date +"%-I:%M %p")
		;;

	OpenBSD*)
		t=$(date +"%I:%M %p")
		;;

esac

echo "$t"
