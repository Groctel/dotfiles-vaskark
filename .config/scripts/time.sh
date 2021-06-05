#!/bin/sh

# current system time

[ -z "$1" ] && set -- '${t}'

t=

case $(uname -s) in
	Linux*)
		t=$(date +"%-I:%M %P")
		;;
	FreeBSD*)
		t=$(date +"%-I:%M %P")
		;;
	OpenBSD*)
		t=$(date +"%I:%M %P")
		;;
	*)
		#echo "Unsupported os: $(uname -s)" >&2
        exit 1
    	;;
esac

eval echo "$1"

		
