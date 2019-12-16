#!/bin/sh

Clock(){
	DATE=$(date "+%a %b %-d %Y")
	TIME=$(date "+%I:%M %p")

#	echo -e -n "\uf133 ${DATE} \uf017 ${TIME}"
	echo -e -n "\ue192 ${TIME}"
}

ActiveWindow(){
	echo -n $(xdotool getwindowfocus getwindowname)
}

Battery() {
	BATTACPI=$(acpi --battery)
	BATPERC=$(echo $BATTACPI | cut -d, -f2 | tr -d '[:space:]')

	if [[ $BATTACPI == *"100%"* ]]
	then
		echo -e -n "\ue1a3 $BATPERC"
	elif [[ $BATTACPI == *"Discharging"* ]]
	then
		BATPERC=${BATPERC::-1}
		if [ $BATPERC -le "10" ]
		then
			echo -e -n "\ue1a3"
		elif [ $BATPERC -le "25" ]
		then
			echo -e -n "\ue1a3"
		elif [ $BATPERC -le "50" ]
		then
			echo -e -n "\ue1a3"
		elif [ $BATPERC -le "75" ]
		then
			echo -e -n "\ue1a3"
		elif [ $BATPERC -le "100" ]
		then
			echo -e -n "\ue1a3"
		fi
		echo -e " $BATPERC%"
	elif [[ $BATTACPI == *"Charging"* && $BATTACPI != *"100%"* ]]
	then
		echo -e "\ue1a6 $BATPERC"
	elif [[ $BATTACPI == *"Unknown"* ]]
	then
		echo -e "$BATPERC"
	fi
}

Wifi(){
	WIFISTR=$( iwconfig wlp2s0 | grep "Link" | sed 's/ //g' | sed 's/LinkQuality=//g' | sed 's/\/.*//g')
	if [ ! -z $WIFISTR ] ; then
		WIFISTR=$(( ${WIFISTR} * 100 / 70))
		ESSID=$(iwconfig wlp2s0 | grep ESSID | sed 's/ //g' | sed 's/.*://' | cut -d "\"" -f 2)
		if [ $WIFISTR -ge 1 ] ; then
#			echo -e "\uf1eb ${ESSID} ${WIFISTR}%"
			echo -e "\ue63e ${ESSID}"
		fi
	fi
}

Sound(){
	NOTMUTED=$( amixer sget Master | grep "\[on\]" )
	if [[ ! -z $NOTMUTED ]] ; then
		VOL=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master) | sed 's/%//g')
		if [ $VOL -ge 85 ] ; then
			echo -e "\ue050 ${VOL}%"
		elif [ $VOL -ge 50 ] ; then
			echo -e "\ue04d ${VOL}%"
		else
			echo -e "\ue04e ${VOL}%"
		fi
	else
		echo -e "\ue04f --"
	fi
}

Language(){
	CURRENTLANG=$(head -n 1 /tmp/uim-state)
	if [[ $CURRENTLANG == *"English"* ]] ; then
		echo -e " \uf0ac ENG"
	elif [[ $CURRENTLANG == *"Katakana"* ]] ; then
		echo -e " \uf0ac カタカナ"
	elif [[ $CURRENTLANG == *"Hiragana"* ]] ; then
		echo -e " \uf0ac ひらがな"
	else
		echo -e " \uf0ac \uf128"
	fi
}

Groups() {
	cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'
	tot=`xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}'

	# Desktop numbers start at 0. if you want desktop 2 to be in second place,
	# start counting from 1 instead of 0. But you'll lose a group ;)
	for w in `seq 0 $((cur - 1))`; do line="${line}="; done

	# enough =, let's print the current desktop
	line="${line}|"

	# And then the other groups
	for w in `seq $((cur + 2)) $tot`; do line="${line}="; done

	# don't forget to print that line!
	echo $line
}

MPD(){
	echo -e "\ue3a1" $(mpc current)
}

while true; do
    echo -e "%{c}$(ActiveWindow)" "%{r}$(Wifi)  $(Battery)  $(Sound)  $(Clock)  "
	sleep 0.1s
done
