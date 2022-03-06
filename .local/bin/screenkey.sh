#!/usr/bin/env bash

[[ $1 == -k ]] && killall screenkey ||
	screenkey -g 500x400+710+650 -t 1.2 -s small --bg-color \#101010 --font-color \#a0a0a0
