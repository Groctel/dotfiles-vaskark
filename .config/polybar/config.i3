;==========================================================
;
;
;   ██████╗  ██████╗ ██╗  ██╗   ██╗██████╗  █████╗ ██████╗
;   ██╔══██╗██╔═══██╗██║  ╚██╗ ██╔╝██╔══██╗██╔══██╗██╔══██╗
;   ██████╔╝██║   ██║██║   ╚████╔╝ ██████╔╝███████║██████╔╝
;   ██╔═══╝ ██║   ██║██║    ╚██╔╝  ██╔══██╗██╔══██║██╔══██╗
;   ██║     ╚██████╔╝███████╗██║   ██████╔╝██║  ██║██║  ██║
;   ╚═╝      ╚═════╝ ╚══════╝╚═╝   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
;
;
;   To learn more about how to configure Polybar
;   go to https://github.com/jaagr/polybar
;
;   The README contains alot of information
;
;==========================================================

[global/wm]
margin-top = 0
margin-bottom = 0

[settings]
screenchange-reload = true
;compositing-background = xor
;compositing-background = screen
;compositing-foreground = source
;compositing-border = over

[colors]
;xrdb, dkeg-skigh
color0 = ${xrdb:color0:#252a32}
color1 = ${xrdb:color1:#876058}
;color1 = ${env:color1_alpha}
color2 = ${xrdb:color2:#6f7f71}
color3 = ${xrdb:color3:#b39580}
color4 = ${xrdb:color4:#546780}
color5 = ${xrdb:color5:#84787d}
color6 = ${xrdb:color6:#556f86}
color7 = ${xrdb:color7:#bab7b5}
color8 = ${xrdb:color8:#bab7b5}
color9 = ${xrdb:color9:#876058}
color10 = ${xrdb:color10:#6f7f71}
color11 = ${xrdb:color11:#b39580}
color12 = ${xrdb:color12:#546780}
color13 = ${xrdb:color13:#84787d}
color14 = ${xrdb:color14:#556f86}
color15 = ${xrdb:color15:#dfdedd}

##############################################
##############################################

[bar/main]
;monitor = ${env:MONITOR:eDP-1}
width = 100%
height = 30
radius = 0
fixed-center = true
bottom = false
enable-ipc = true

;offset-x = 2%
;offset-y = 1.8%

background = transparent
foreground =

line-size =
line-color =

border-size = 5
border-color = transparent

padding-left = 0
padding-right = 0

module-margin-left = 0
module-margin-right = 0

font-0 = "scientifica:bold:size=8;2"
font-1 = "siji:size=9;2"
font-2 = "Weather Icons:size=8;2"
font-3 = "JoyPixels:pixelsize=16;2:scale=12;2"

modules-left = i3
modules-center =
modules-right = mpd sep uptime battery wireless wired volume sep nmc wpg

;dim-value = 0.8

;tray-position = right
;tray-padding = 2
;tray-detached = false
;tray-background = ${colors.color0}
;tray-maxsize = 12

;override-redirect = true
;wm-restack = i3

scroll-up = i3wm-wsnext
scroll-down = i3wm-wsprev

;cursor-click = pointer
;cursor-scroll = ns-resize

##################################################
##################################################

[module/sep]
type = custom/text
content = " "

content-background = transparent
content-foreground = transparent
content-padding = 0

##################################################

[module/i3]
type = internal/i3
index-sort = true
wrapping-scroll = false
enable-click = true
enable-scroll = false
reverse-scroll = false

; workspace icons
ws-icon-0 = 1;
ws-icon-1 = 2;
ws-icon-2 = 3;
ws-icon-3 = 4;
ws-icon-4 = 5;
ws-icon-5 = 6;
ws-icon-6 = 7;
ws-icon-7 = 8;
ws-icon-8 = 9;
ws-icon-9 = 10;

; Only show workspaces on the same output as the bar
pin-workspaces = true

format = <label-state> <label-mode>

label-mode = %mode%
label-mode-padding = 2
label-mode-foreground = ${colors.color0}
label-mode-background = ${colors.color2}

; focused = Active workspace on focused monitor
label-focused = %index%
label-focused-foreground = ${colors.color0}
label-focused-background = ${colors.color2}
label-focused-padding = 2

; unfocused = Inactive workspace on any monitor
label-unfocused = %index%
label-unfocused-foreground = ${colors.color2}
label-unfocused-background = ${colors.color0}
label-unfocused-padding = 2

; visible = Active workspace on unfocused monitor
label-visible = %index%
label-visible-padding = 2

; urgent = Workspace with urgency hint set
label-urgent = %index%
label-urgent-foreground = ${colors.color0}
label-urgent-background = ${colors.color1}
label-urgent-padding = 2

label-separator =
label-separator-foreground =
label-separator-padding =

##################################################

[module/ewmh]
type = internal/xworkspaces
pin-workspaces = false
enable-click = true
enable-scroll = true

label-monitor = %name%
format = <label-state>

label-monitor-background = ${colors.color2}
label-monitor-foreground = ${colors.color0}
label-monitor-padding = 2

label-active = %index%
label-active-background = ${colors.color2}
label-active-foreground = ${colors.color0}
label-active-padding = 2

label-occupied = %index%
label-occupied-background = ${colors.color0}
label-occupied-foreground = ${colors.color2}
label-occupied-padding = 2

label-urgent = %index%
label-urgent-background = ${colors.color1}
label-urgent-foreground = ${colors.color0}
label-urgent-padding = 2

label-empty = %index%
label-empty-background = ${colors.color0}
label-empty-foreground = #444
label-empty-padding = 2

##################################################

[module/ewmh-i]
type = internal/xworkspaces
pin-workspaces = false
enable-click = true
enable-scroll = true

; workspace icons
icon-0 = 0;
icon-1 = 1;
icon-2 = 2;
icon-3 = 3;
icon-4 = 4;
;icon-5 = 5;
;icon-6 = 6;
;icon-7 = 7;
;icon-8 = 8;
;icon-9 = 9:

label-monitor = %name%
format = <label-state>

label-monitor-background = ${colors.color2}
label-monitor-foreground = ${colors.color0}
label-monitor-padding = 2

label-active = %icon%
label-active-background = ${colors.color2}
label-active-foreground = ${colors.color0}
label-active-padding = 2

label-occupied = %icon%
label-occupied-background = ${colors.color0}
label-occupied-foreground = ${colors.color2}
label-occupied-padding = 2

label-urgent = %icon%
label-urgent-background = ${colors.color1}
label-urgent-foreground = ${colors.color0}
label-urgent-padding = 2

label-empty = %icon%
label-empty-background = ${colors.color0}
label-empty-foreground = #444
label-empty-padding = 2

##################################################

[module/mpd]
type = internal/mpd
host = 127.0.0.1
port = 6600

label-song = %{A1:mpc toggle > /tmp/toggle.log 2>&1:}%{A2:kitty -e ncmpcpp:}%{A3:mpc next:}%{A8:mpc prev:}%artist%  //  %title%%{A}%{A}%{A}%{A}

format-online = <label-song>
label-song-background = ${colors.color2}
label-song-foreground = ${colors.color0}
label-song-padding = 2

#format-online-prefix = "🌮️"
format-online-prefix = ""
format-online-prefix-background = ${colors.color0}
format-online-prefix-foreground = ${colors.color2}
format-online-prefix-padding = 2

label-offline = MPD offline :(

format-offline = <label-offline>
format-offline-background = ${colors.color2}
format-offline-foreground = ${colors.color0}
format-offline-padding = 2

label-song-maxlen = 200
label-song-ellipsis = true

##################################################

[module/mpd-t]
type = internal/mpd
host = 127.0.0.1
port = 6600

label-time = [%elapsed%/%total%]

format-online = <label-time>
format-online-background = ${colors.color0}
format-online-foreground = ${colors.color2}
format-online-padding = 2

##################################################

[module/mpd-c]
type = internal/mpd
host = 127.0.0.1
port = 6600

format-online = <icon-prev>  <toggle>  <icon-next>
format-online-background = ${colors.color2}
format-online-foreground = ${colors.color0}
format-online-padding = 2

icon-prev = 
icon-play = 
icon-pause = 
icon-next = 

##################################################

[module/wireless]
type = internal/network
interface = wlp2s0
interval = 1.0
accumulate-stats = true
unknown-as-up = true

label-connected = %essid% [%downspeed%]

format-connected = <ramp-signal> <label-connected>
format-connected-background = ${colors.color0}
format-connected-foreground = ${colors.color2}
format-connected-padding = 2

label-disconnected =  Disconnected

format-disconnected = <label-disconnected>
format-disconnected-background = ${colors.color0}
format-disconnected-foreground = ${colors.color2}
format-disconnected-padding = 2

ramp-signal-0 = 
ramp-signal-1 = 
ramp-signal-2 = 
ramp-signal-3 = 
ramp-signal-4 = 

##################################################

[module/wired]
type = internal/network
interface = enp0s3
interval = 1.0
accumulate-stats = true
unknown-as-up = true

label-connected = %ifname% [%downspeed%]

format-connected = <ramp-signal> <label-connected>
format-connected-background = ${colors.color0}
format-connected-foreground = ${colors.color2}
format-connected-padding = 2

label-disconnected =  Disconnected

format-disconnected = <label-disconnected>
format-disconnected-background = ${colors.color0}
format-disconnected-foreground = ${colors.color2}
format-disconnected-padding = 2

ramp-signal-0 = 
ramp-signal-1 = 
ramp-signal-2 = 
ramp-signal-3 = 
ramp-signal-4 = 

##################################################

[module/volume]
type = internal/pulseaudio
sink = alsa_output.pci-0000_00_1f.3.analog-stereo
click-right = pavucontrol &

label-volume = %percentage%%

format-volume = <ramp-volume> <label-volume>
format-volume-background = ${colors.color2}
format-volume-foreground = ${colors.color0}
format-volume-padding = 2

label-muted =  ---

format-muted = <label-muted>
format-muted-background = ${colors.color2}
format-muted-foreground = ${colors.color0}
format-muted-padding = 2

ramp-volume-0 = 
ramp-volume-1 = 
ramp-volume-2 = 
ramp-volume-3 = 
ramp-volume-4 = 

##################################################

[module/memory]
type = internal/memory
interval = 3

label =   %percentage_used%%

format = <label>
format-background = ${colors.color2}
format-foreground = ${colors.color0}
format-padding = 2

##################################################

[module/battery]
type = internal/battery
full-at = 98
battery = BAT0
adapter = AC0
poll-interval = 2

label-charging = %percentage%%

format-charging = <ramp-capacity> <label-charging>
format-charging-background = ${colors.color2}
format-charging-foreground = ${colors.color0}
format-charging-padding = 2

label-discharging = %percentage%%

format-discharging = <ramp-capacity> <label-discharging>
format-discharging-background = ${colors.color2}
format-discharging-foreground = ${colors.color0}
format-discharging-padding = 2

label-full = %percentage%%

format-full = <ramp-capacity> <label-full>
format-full-background = ${colors.color2}
format-full-foreground = ${colors.color0}
format-full-padding = 2

ramp-capacity-0 = 
ramp-capacity-1 = 
ramp-capacity-2 = 
ramp-capacity-3 = 
ramp-capacity-4 = 

##################################################

[module/temp]
type = internal/temperature
thermal-zone = 0
warn-temperature = 65

label =  %temperature-c%

format = <label>
format-background = ${colors.color2}
format-foreground = ${colors.color0}
format-padding = 2

label-warn =  %temperature-c%

format-warn = <label-warn>
format-warn-background = ${colors.color1}
format-warn-foreground = ${colors.color0}
format-warn-padding = 2

##################################################

[module/date]
type = internal/date
interval = 1

time =  %I:%M %p
time-alt =  %A %B %d %Y

label = %time%

format = <label>
format-foreground = ${colors.color2}
format-background = ${colors.color0}
format-padding = 2

##################################################

[module/uptime]
type = custom/script
exec = ~/.config/polybar/scripts/system-uptime-pretty.sh
interval = 30

label =  %output%
format = <label>

format-foreground = ${colors.color0}
format-background = ${colors.color1}
format-padding = 2

##################################################

[module/session]
type = custom/script
exec = echo $DESKTOP_SESSION
click-right = exit.sh

label-background = ${colors.color2}
label-foreground = ${colors.color0}
label-padding = 2

##################################################

[module/kernel]
type = custom/script
exec = uname -r
interval = 1024

label =  %output%

label-background = ${colors.color2}
label-foreground = ${colors.color0}
label-padding = 2

##################################################

[module/weather]
type = custom/script
exec = ~/.config/polybar/scripts/openweathermap-detailed.sh
#exec = curl -s "wttr.in/Hamilton?format="+%C+%t""
click-left = gnome-weather &
interval = 600

label = %output%

label-background = ${colors.color2}
label-foreground = ${colors.color0}
label-padding = 2

##################################################

[module/apt]
type = custom/script
exec = ~/.config/polybar/scripts/updates-apt.sh
click-left = synaptic-pkexec &
interval = 600

label =  %output%

label-background = ${colors.color2}
label-foreground = ${colors.color0}
label-padding = 2

##################################################
##################################################

[module/blur]
type = custom/text
content = " "
click-left = picom-blur.sh &
click-right = picom-rounded.sh &

content-background = ${colors.color4}
content-foreground = ${colors.color0}
content-padding = 1

##################################################

[module/nmc]
type = custom/text
content = " "
click-left = nm-connection-editor &

content-background = ${colors.color4}
content-foreground = ${colors.color0}
content-padding = 1

##################################################

[module/wpg]
type = custom/text
content = " "
click-left = wal -f random_user -o wal-berry.sh -o wal-cava.sh -o wal-dunst.sh -o wal-glava-b.sh &
click-right = wpg -r &

content-background = ${colors.color4}
content-foreground = ${colors.color0}
content-padding = 1

##################################################
##################################################

; vim:ft=dosini
