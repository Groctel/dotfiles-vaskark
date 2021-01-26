#!/bin/sh

xset +fp /usr/local/share/fonts/misc &
xclickroot -r xmenu.sh &
picom --experimental-backends --config ~/.config/picom/picom.conf &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
xautolock -time 10 -locker 'lock.sh' -killer 'systemctl suspend' -corners 00-+ &
redshift.sh &
wal -R -o wal-extras.sh &
$HOME/.fehbg &


## relaunch if the binary changes, otherwise bail
csum=$(sha1sum $(which simplewm))
new_csum=""
while true
do
    if [ "$csum" != "$new_csum" ]
    then
        csum=$new_csum
        simplewm
    else
        exit 0
    fi
    new_csum=$(sha1sum $(which simplewm))
    sleep 0.5
done
