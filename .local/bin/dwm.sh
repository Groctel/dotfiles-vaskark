#!/bin/sh

# autostart
xset +fp /usr/local/share/fonts/misc &
picom --experimental-backends --config ~/.config/picom/picom.conf &
xautolock -time 10 -locker 'lock.sh' -killer 'systemctl suspend' -corners 00-+ &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
wal -R -o wal-extras.sh &

# status bar
while true
do
	LOCAL=$(date +"%I:%M %p")
	BAT=$(acpi -b | awk '{ print $5 }' | tr -d ',')
	TEMP="$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C"
	VOL=$(amixer -D pulse get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
	xsetroot -name " $TEMP  /   $BAT  /   $VOL  /   $LOCAL "
	sleep 0.1
done &

exec dwm