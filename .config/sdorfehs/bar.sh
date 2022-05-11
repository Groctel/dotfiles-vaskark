#!/bin/sh

#
# sdorfehs bar
#

. "$HOME"/.cache/wal/colors.sh

###

Music() {

  TRACK="$(mpc current -f "%artist% ∎ %title%")"
  ICON=""
  echo "^fn(siji:size=8)^fg($color5)$ICON^fg()^fn() $TRACK"

}

Uptime() {

  UP=$("$HOME"/.config/scripts/uptime.sh)
  ICON=""
  echo "^fn(siji:size=8)^fg($color5)$ICON^fg()^fn() $UP"

}

Cpu() {

  CPU=$("$HOME"/.config/scripts/cpu.sh)
  ICON=""
  echo "^fn(siji:size=8)^fg($color5)$ICON^fg()^fn() $CPU"

}

Memory() {

  T=$(grep MemTotal < /proc/meminfo | awk '{print $2}')
  F=$(grep MemFree < /proc/meminfo | awk '{print $2}')
  B=$(grep Buffers < /proc/meminfo | awk '{print $2}')
  C=$(grep Cached < /proc/meminfo | awk 'NR==1 {print $2}')

  USED=$(( 100*(T - F - B - C) / T ))
  ICON=""
  echo "^fn(siji:size=8)^fg($color5)$ICON^fg()^fn() $USED%"

}

Battery() {

  CHARGE=$(acpi | grep "Not charging")
  CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)

  if [ -n "$CHARGE" ] ; then
    ICON=""
    echo "^fn(siji:size=8)^fg($color5)$ICON^fg()^fn() $CAPACITY%"
  else
    ICON=""
    echo "^fn(siji:size=8)^fg($color5)$ICON^fg()^fn() $CAPACITY%"
  fi

}

Volume() {

  NOTMUTED=$(amixer -D pulse sget Master | grep "\[on\]")

  if [ -n "$NOTMUTED" ] ; then
    VOL=$(amixer -D pulse sget Master | awk -F"[][]" '/Left:/ { print $2 }' | sed 's/%//g')
    ICON=""
    echo "^fn(siji:size=8)^fg($color5)$ICON^fg()^fn() $VOL%"
  else
    ICON=""
    echo "^fn(siji:size=8)^fg(#444)$ICON^fg()^fn() --%"
  fi

}

Time() {

  TIME="$(date "+%-I:%M %p")"
  ICON=""
  echo "^fn(siji:size=8)^fg($color2)$ICON^fg()^fn() $TIME"

}

###

while true; do
  echo "$(Music)  $(Uptime)  $(Cpu)  $(Memory)  $(Battery)  $(Volume)  $(Time)" > ~/.config/sdorfehs/bar
  sleep 1
done