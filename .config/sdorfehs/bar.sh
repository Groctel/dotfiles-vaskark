#!/bin/sh

#
# sdorfehs bar
#

. "$HOME"/.cache/wal/colors.sh

----------

Mpc() {
  current="$(mpc current -f "%title%")"
  icon=""
  echo "^fn(siji:size=8)^fg($color5)$icon^fg()^fn() ^ca(btn,mpc toggle)$current^ca()"
}

Uptime() {
  uptime=$("$HOME"/.config/scripts/uptime.sh)
  icon=""
  echo "^fn(siji:size=8)^fg($color2)$icon^fg()^fn() $uptime"
}

Kernel() {
  kern=$(uname -r)
  icon=""
  echo "^fn(siji:size=8)^fg($color5)$icon^fg()^fn() $kern"
}

Time() {
  current="$(date "+%-I:%M %p")"
  icon=""
  echo "^fn(siji:size=8)^fg($color2)$icon^fg()^fn() $current"
}

----------

while true; do
  echo "$(Mpc) ∎ $(Uptime) ∎ $(Kernel) ∎ $(Time)" > ~/.config/sdorfehs/bar
  sleep 0.5
done