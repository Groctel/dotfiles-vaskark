#!/bin/bash

## Lemonbar menu

MENU="$(rofi -sep "|" -dmenu -i -p 'Lemonbars:' -location 0 -width 10 -line-padding 4 -padding 20 -lines 5 <<< "Default|NF|Feather|-----|OFF")"

case "$MENU" in
	
	*Default)
		rm -f $HOME/.local/bin/lemonbar-current 2>/dev/null
		ln -s $HOME/.local/bin/lemonbar-start.sh $HOME/.local/bin/lemonbar-current
		killall -9 lemonbar 2>/dev/null
		lemonbar-current &
	;;

	*NF)
		rm -f $HOME/.local/bin/lemonbar-current 2>/dev/null
		ln -s $HOME/.local/bin/lemonbar-nf-start.sh $HOME/.local/bin/lemonbar-current
		killall -9 lemonbar 2>/dev/null
		lemonbar-current &
	;;

	*Feather)
		rm -f $HOME/.local/bin/lemonbar-current 2>/dev/null
		ln -s $HOME/.local/bin/lemonbar-fr-start.sh $HOME/.local/bin/lemonbar-current
		killall -9 lemonbar 2>/dev/null
		lemonbar-current &
	;;

	*-----)
	;;

	*OFF)
		killall -9 lemonbar 2>/dev/null
	;;

esac
