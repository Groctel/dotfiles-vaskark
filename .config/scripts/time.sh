#!/bin/sh

# current system time

[ -z "$1" ] && set -- '${t}'

t=

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
	*)
		#echo "Unsupported os: $(uname -s)" >&2
        exit 1
    	;;
esac

eval echo "$1"

		
