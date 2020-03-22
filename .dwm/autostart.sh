#! /bin/bash 

# startup
#nitrogen --restore &
pulseaudio --start --log-target=syslog &
#redshift.sh &
xautolock.sh &
picom.sh &
#dunst &
libinput-gestures &
wal -R &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

# statusbar
while true; do
	xsetroot -name "$( date +"%I:%M %p" )"
	sleep 1m
done &
