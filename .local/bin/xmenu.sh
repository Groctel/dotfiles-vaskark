#!/bin/sh

cat <<EOF | xmenu | sh &
Audio
	Audacity	audacity
	Rhythmbox	rhythmbox
Graphics
	GIMP		gimp
Files
	Nautilus	nautilus
	Nemo		nemo
Internet
	Chrome		google-chrome
	Firefox	firefox
	Transmission	transmission-gtk
System
	Bleachbit	pkexec bleachbit
	Nemo		pkexec nemo
	Synaptic	pkexec synaptic
Term
	Alacritty	alacritty
	Kitty		kitty
	Termite	termite
	St		st
Video
	Celluloid	celluloid
	VLC		vlc

Reboot			reboot
Shutdown		poweroff
EOF
