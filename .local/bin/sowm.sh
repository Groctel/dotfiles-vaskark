#!/bin/sh

## autostart
xset +fp /usr/local/share/fonts/misc &
picom --experimental-backends --config ~/.config/picom/picom.conf &
xautolock -time 10 -locker 'lock.sh' -killer 'systemctl suspend' -corners 00-+ &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
wal -R -o wal-extras.sh &
lemonbar-start.sh &

## relaunch sowm if the binary changes, otherwise bail
csum=$(sha1sum $(which sowm))
new_csum=""
while true
do
    if [ "$csum" != "$new_csum" ]
    then
        csum=$new_csum
        sowm
    else
        exit 0
    fi
    new_csum=$(sha1sum $(which sowm))
    sleep 0.5
done
