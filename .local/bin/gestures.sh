#!/bin/bash

libinput-gestures-setup stop
sleep 0.1
libinput-gestures -c ~/.config/libinput-gestures/libinput-gestures.conf &
