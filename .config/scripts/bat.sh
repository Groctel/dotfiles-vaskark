#!/bin/sh

# get battery charge (%)

[ -z "$1" ] && set -- '${p}'

p=

case $(uname -s) in
	Linux*)
		p=$(acpi --battery | cut -d, -f2)
		;;
	OpenBSD*)
		p=$(apm | awk 'NR==1 { print $4 }')
		;;
	FreeBSD*)
		p=$(apm | awk 'NR==5 { print $4 }')
		;;
	*)
		#echo "Unsupported os: $(uname -s)" >&2
        	exit 1
    		;;
esac

eval echo "$1"
