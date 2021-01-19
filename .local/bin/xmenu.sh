#!/bin/bash

cat <<EOF | xmenu | sh &
Term		alacritty
Web		google-chrome-stable

Apps
	Appearance	lxappearance
	Bleachbit	bleachbit
	Birdfont	birdfont
	Calculator	gnome-calculator
	Calendar	gnome-calendar
	Calibre		calibre
	Flameshot	flameshot gui
	Foliate		foliate
	Font Manager	font-manager
	Gitg		gitg
	Meld		meld
	Nautilus	nautilus
	Nemo		nemo
	Plank		plank
	Text Editor	gedit
	Weather		gnome-weather
	Zathura		zathura
Audio
	Audacity	audacity
	Easytag		easytag
	PulseAudio	pavucontrol
	Rhythmbox	rhythmbox
	yMuse		ymuse
Graphics
	GIMP		gimp
	Inkscape	inkscape
	Pick		pick-colour-picker
	YACReader	YACReader
Internet
	Chrome		google-chrome
	Firefox		firefox
	Transmission	transmission-gtk
Office
	LibreOffice	libreoffice
	
	Base		lobase
	Calc		localc
	Draw		lodraw
	Impress		loimpress
	Math		lomath
	Writer		lowriter
System
	Bleachbit	pkexec bleachbit
	Boxes		gnome-boxes
	Firewall	gufw-pkexec
	Logs		gnome-system-log-pkexec
	Gnome Logs	gnome-logs
	Monitor		gnome-system-monitor
	Nautilus	nautilus-pkexec
	Nemo		nemo-pkexec
	Stacer		stacer
	Synaptic	synaptic-pkexec
Terms
	Alacritty	alacritty
	Kitty		kitty
	St		st
	Termite		termite
	URxvt		urxvt
	XTerm		xterm
Video
	Celluloid	celluloid
	MKVToolnix	mkvtoolnix-gui
	MPV		mpv --player-operation-mode=pseudo-gui
	VLC		vlc

Logout			pkill x
Reboot			reboot
Off			poweroff
EOF
