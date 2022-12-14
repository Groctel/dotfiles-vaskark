#!/bin/sh

# battery charge (%)

case $(uname -s) in

	Linux*)

		NC=$(acpi | grep "Not charging")
		if [ ! "$NC" ] ; then
    		# charging/discharging
    		p=$(acpi | awk '{ print $4 }' | sed 's/,//g')
		else
    		# not charging (full)
    		p=$(acpi | awk '{ print $5 }')
		fi
		;;

	OpenBSD*)

		p=$(apm -l)%
		;;

	FreeBSD*)

		p=$(apm | awk 'NR==5 { print $4 }')
		;;

	# *)
	# 	echo "Unsupported os: $(uname -s)" >&2
 #        exit 1
 #    	;;

esac

echo "$p"

