#!/bin/sh
IN=~/.config/spectrwm/spectrwm_fi.conf
OUT=/tmp/spectrwm_fi.pdf
enscript $IN -o - | ps2pdf - $OUT | zathura $OUT
