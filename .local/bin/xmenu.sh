#!/bin/sh

cat <<EOF | xmenu | sh &
Alacritty		alacritty
Chrome			google-chrome-stable

Apps
	Appearance	lxappearance
	Bleachbit	bleachbit
	Calculator	gnome-calculator
	Calendar	gnome-calendar
	Calibre	calibre
	Flameshot	flameshot gui
	Foliate	foliate
	Font Manager	font-manager
	Gitg		gitg
	Meld		meld
	Nautilus	nautilus
	Nemo		nemo
	Plank		plank
	Text Editor	gedit
	Weather	gnome-weather
	Zathura	zathura
Graphics
	GIMP		gimp
	Inkscape	inkscape
	Pick		pick-colour-picker
	YACReader	yacreader
Internet
	Chrome		google-chrome
	Firefox	firefox
	Transmission	transmission-gtk
Sound
	Audacity	audacity
	Easytag	easytag
	PulseAudio	pavucontrol
	Rhythmbox	rhythmbox
System
	Bleachbit	pkexec bleachbit
	Boxes		gnome-boxes
	Firewall	gufw-pkexec
	Logs		gnome-system-log-pkexec
	Monitor	gnome-system-monitor
	Nautilus	nautilus-pkexec
	Nemo		nemo-pkexec
	Stacer		stacer
	Synaptic	synaptic-pkexec
Terms
	Alacritty	alacritty
	Byobu		byobu
	Kitty		kitty
	Termite	termite
	St		st
Video
	Celluloid	celluloid
	MKVToolnix	mkvtoolnix-gui
	Peek		peek
	VLC		vlc

Logout			pkill x
Reboot			reboot
Shut			poweroff
EOF
