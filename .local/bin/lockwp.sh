#!/bin/bash
cp $HOME/Pictures/$(wpg -c) /tmp/lock.jpg
convert /tmp/lock.jpg -blur 0x50 -fill black -colorize 30% /tmp/lockblur.jpg
