#!/bin/bash

if [ "$1" == "first_child" ]
then
  bspc config automatic_scheme first_child
  notify-send -t 3000 "Mode: first child"
  exit 0
elif [ "$1" == "longest_side" ]
then
  bspc config automatic_scheme longest_side
  notify-send -t 3000 "Mode: longest side"
  exit 0
elif [ "$1" == "spiral" ]
then
  bspc config automatic_scheme spiral
  notify-send -t 3000 "Mode: spiral"
  exit 0
else
  notify-send -t 3000 "Mode: invalid"
  exit 1
fi
