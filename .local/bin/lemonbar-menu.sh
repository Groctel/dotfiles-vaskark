#!/bin/bash

## Lemonbar menu

MENU="$(rofi -sep "|" -dmenu -i -p 'Lemonbars:' -location 0 -width 10 -line-padding 4 -padding 20 -lines 5 <<< "Siji|NF|Typicons|Microns|OFF")"

case "$MENU" in
	
	*Siji)
		rm -f $HOME/.local/bin/lemonbar-current 2>/dev/null
		ln -s $HOME/.local/bin/lemonbar-start.sh $HOME/.local/bin/lemonbar-current
		killall -9 lemonbar 2>/dev/null
		lemonbar-current 2>/dev/null &
	;;

	*NF)
		rm -f $HOME/.local/bin/lemonbar-current 2>/dev/null
		ln -s $HOME/.local/bin/lemonbar-nf-start.sh $HOME/.local/bin/lemonbar-current
		killall -9 lemonbar 2>/dev/null
		lemonbar-current 2>/dev/null &
	;;

	*Typicons)
		rm -f $HOME/.local/bin/lemonbar-current 2>/dev/null
		ln -s $HOME/.local/bin/lemonbar-tp-start.sh $HOME/.local/bin/lemonbar-current
		killall -9 lemonbar 2>/dev/null
		lemonbar-current 2>/dev/null &
	;;

	*Microns)
		rm -f $HOME/.local/bin/lemonbar-current 2>/dev/null
		ln -s $HOME/.local/bin/lemonbar-mc-start.sh $HOME/.local/bin/lemonbar-current
		killall -9 lemonbar 2>/dev/null
		lemonbar-current 2>/dev/null &
	;;

	*OFF)
		killall -9 lemonbar 2>/dev/null
	;;

esac
