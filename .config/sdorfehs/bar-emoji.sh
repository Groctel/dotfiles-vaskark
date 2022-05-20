#!/bin/sh

#
# sdorfehs bar
#

# colours
. "$HOME"/.cache/wal/colors.sh

###

music() {

  TRACK="$(mpc current -f "%artist% ∎ %title%")"
  ICON="🎵"
  echo "^fn(Emoji:size=7)$ICON^fn() $TRACK"

}

wifi() {

  INTERFACE=$(ip addr | awk '/state UP/ {print $2}' | sed 's/://g')
  WIFISTR=$(iwconfig "$INTERFACE" | grep "Link" | sed 's/ //g' | sed 's/LinkQuality=//g' | sed 's/\/.*//g') 

  if [ -n "$WIFISTR" ] ; then

    WIFISTR=$(( WIFISTR * 100 / 70 ))
    ESSID=$(iwconfig "$INTERFACE" | grep ESSID | sed 's/ //g' | sed 's/.*://g' | sed 's/\"//g')

    if [ "$WIFISTR" -ge 1 ] ; then

      RKBPS=$(ifstat -i "$INTERFACE" 0.2s 1 | awk 'NR==3 {print $1}' | sed 's:\.[^|]*::g')
      MKBPS=$(( RKBPS / 1024 ))
      ICON="💨"

      if [ "$RKBPS" -le 999 ]; then
        echo "^fn(Emoji:size=7)$ICON^fn() $ESSID [$RKBPS Kb/s]"
      else
        echo "^fn(Emoji:size=7)$ICON^fn() $ESSID [$MKBPS Mb/s]"
      fi

    fi

  fi

}

uptime() {

  UP=$("$HOME"/.config/scripts/uptime.sh)
  ICON="⏳"
  echo "^fn(Emoji:size=7)$ICON^fn() $UP"

}

cpu() {

  CPU=$("$HOME"/.config/scripts/cpu.sh)
  ICON="🤖"
  echo "^fn(Emoji:size=7)$ICON^fn() $CPU"

}

memory() {

  T=$(grep MemTotal < /proc/meminfo | awk '{print $2}')
  F=$(grep MemFree < /proc/meminfo | awk '{print $2}')
  B=$(grep Buffers < /proc/meminfo | awk '{print $2}')
  C=$(grep Cached < /proc/meminfo | awk 'NR==1 {print $2}')

  USED=$(( 100*(T - F - B - C) / T ))
  ICON="🍜"
  echo "^fn(Emoji:size=7)$ICON^fn() $USED%"

}

battery() {

  CHARGE=$(acpi | grep "Not charging")
  CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)

  if [ -n "$CHARGE" ] ; then
    ICON="🔌"
    echo "^fn(Emoji:size=7)$ICON^fn() $CAPACITY%"
  else
    ICON="🔋"
    echo "^fn(Emoji:size=7)$ICON^fn() $CAPACITY%"
  fi

}

volume() {

  NOTMUTED=$(amixer -D pulse sget Master | grep "\[on\]")

  if [ -n "$NOTMUTED" ] ; then
    VOL=$(amixer -D pulse sget Master | awk -F"[][]" '/Left:/ { print $2 }' | sed 's/%//g')
    ICON="🔊"
    echo "^fn(Emoji:size=7)$ICON^fn() $VOL%"
  else
    ICON="🔇"
    echo "^fn(Emoji:size=7)$ICON^fn() --%"
  fi

}

time() {

  TIME="$(date "+%-I:%M %p")"
  ICON="⌚"
  echo "^fn(Emoji:size=7)$ICON^fn() $TIME"

}

###

while true; do
  echo "$(wifi)  $(music)  $(uptime)  $(cpu)  $(memory)  $(battery)  $(volume)  $(time)" > ~/.config/sdorfehs/bar
  sleep 1
done
