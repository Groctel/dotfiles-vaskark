#!/bin/sh

# current system time

case $(uname -s) in

	Linux*)
		t=$(date +"%-I:%M %p")
                echo "$t"
		;;

	FreeBSD*)
		t=$(date +"%-I:%M %p")
                echo "$t"
		;;

	OpenBSD*)
		t=$(date +"%I:%M %p")
                echo "$t"
		;;

esac
