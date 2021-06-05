#!/bin/bash

# get battery charge (%)

case $(uname -s) in
	Linux*)
		NC=$(acpi | grep "Not charging")
		if [[ ! $NC ]] ; then
    		# charging/discharging
    		p=$(acpi | awk 'NR==1 { print $4 }' | sed 's/,//g')
		else
    		# not charging (full)
    		p=$(acpi | awk 'NR==1 { print $5 }')
		fi
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

echo "$p"

