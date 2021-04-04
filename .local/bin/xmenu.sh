#!/bin/bash

cat <<EOF | xmenu | sh &
Files		nemo
Term		alacritty
Web		google-chrome

Apps
	Appearance		lxappearance
	Bleachbit		bleachbit
	Calculator		gnome-calculator
	Calendar		gnome-calendar
	Flameshot		flameshot gui
	Foliate			com.github.johnfactotum.Foliate
	Foliate (Library)	com.github.johnfactotum.Foliate --library
	Font Manager		font-manager
	Nautilus		nautilus
	Nemo			nemo
	Plank			plank
	Text Editor		gedit
	Weather			gnome-weather
	Zathura			zathura
Audio
	Audacity		audacity
	Easytag			easytag
	PulseAudio		pavucontrol
	Rhythmbox		rhythmbox
	yMuse			ymuse
Dev
	Gitg			gitg
	Meld			meld
	Sublime Text		subl
	Sublime Merge		smerge
Graphics
	GIMP			gimp
	Inkscape		inkscape
	Pick			pick-colour-picker
	YACReader		YACReader
Internet
	Chrome			google-chrome
	Firefox			firefox
	Transmission		transmission-gtk
Office
	LibreOffice		libreoffice
	
	Base			lobase
	Calc			localc
	Draw			lodraw
	Impress			loimpress
	Math			lomath
	Writer			lowriter
System
	ARandR			arandr
	Bleachbit (Admin)	bleachbit-pkexec
	Boxes			gnome-boxes
	Firewall		gufw-pkexec
	Logs			gnome-system-log-pkexec
	Gnome Logs		gnome-logs
	Monitor			gnome-system-monitor
	Nautilus (Admin)	nautilus-pkexec
	Nemo (Admin)		nemo-pkexec
	Stacer			stacer
	Synaptic		synaptic-pkexec
Terms
	Alacritty		alacritty
	Kitty			kitty
	St			st
	Termite			termite
	URxvt			urxvt
	XTerm			xterm
Video
	Celluloid		celluloid
	MKVToolnix		mkvtoolnix-gui
	MPV			mpv --player-operation-mode=pseudo-gui
	VLC			vlc

Logout				pkill x
Reboot				reboot
Off				poweroff
EOF
