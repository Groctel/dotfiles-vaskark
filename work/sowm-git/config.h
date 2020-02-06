#ifndef CONFIG_H
#define CONFIG_H

#define WHEELSTEP 5
#define MOD Mod4Mask

const char* menu[]    = {"dmenu.sh",      0};
const char* rofi[]    = {"rofi", "-show", "drun",      0};
const char* term[]    = {"kitty",             0};
const char* nmd[]      = {"networkmanager_dmenu", 0};
const char* shot[]   = {"screenshot.sh", "full",            0};
const char* briup[]   = {"light", "-A", "5", 0};
const char* bridown[] = {"light", "-U", "5", 0};
const char* voldown[] = {"pactl", "set-sink-volume", "@DEFAULT_SINK@", "-5%",         0};
const char* volup[]   = {"pactl", "set-sink-volume", "@DEFAULT_SINK@", "+5%",         0};
const char* volmute[] = {"pactl", "set-sink-mute", "@DEFAULT_SINK@", "toggle",      0};

const char* lock[] = {"betterlockscreen", "-l", "pixel", 0};
const char* nautilus[] = {"nautilus", 0};
const char* chrome[] = {"google-chrome", 0};
const char* music[] = {"kitty", "-e", "ncmpcpp", 0};

const char* w0[] = {"wal-favs.sh", 0};
const char* w1[] = {"wal", "-i", "/home/jason/Pictures/favs/", 0};
const char* w2[] = {"wal", "--theme", "random", 0};
const char* wf[] = {"wal", "--theme", "dkeg-skigh", 0}; 
const char* wr[] = {"wal", "-R", 0};

const char* quit[] = {"killall", "sowm.sh", 0};
const char* reboot[] = {"systemctl", "reboot", 0};
const char* shutdown[] = {"systemctl", "poweroff", 0};

static struct key keys[] = {
    {MOD,      		XK_q,   	win_kill,   {0}},
    {MOD,      		XK_c,   	win_center, {0}},
    {MOD,      		XK_f,   	win_fs,     {0}},

    {MOD,           	XK_Tab, 	win_next,   {0}},
    {MOD|ShiftMask, 	XK_Tab, 	win_prev,   {0}},

    {MOD,	        XK_x,	   	run, {.com = menu}},
    {MOD, 	    	XK_d,      	run, {.com = rofi}},
    {MOD,		XK_n,		run, {.com = nmd}},
    {MOD,           	XK_Print,      	run, {.com = shot}},
    {MOD,           	XK_Return, 	run, {.com = term}},

    {MOD, 		XK_Escape, 	run, {.com = lock}},
    {MOD, 		XK_F1,     	run, {.com = nautilus}},
    {MOD, 		XK_F2,     	run, {.com = chrome}},
    {MOD, 		XK_F3,     	run, {.com = music}},

    {MOD,               XK_F8,          run, {.com = w0}},
    {MOD,		XK_F9,		run, {.com = w1}},
    {MOD,		XK_F10,		run, {.com = w2}},
    {MOD,		XK_F11,		run, {.com = wf}},
    {MOD,               XK_F12,         run, {.com = wr}},

    {MOD, 		XK_Delete, 	run, {.com = quit}},
    {MOD|ShiftMask,	XK_Delete,	run, {.com = reboot}},
    {MOD|ControlMask,	XK_Delete,	run, {.com = shutdown}},

    {0,   XF86XK_AudioLowerVolume,  run, {.com = voldown}},
    {0,   XF86XK_AudioRaiseVolume,  run, {.com = volup}},
    {0,   XF86XK_AudioMute,         run, {.com = volmute}},
    {0,   XF86XK_MonBrightnessUp,   run, {.com = briup}},
    {0,   XF86XK_MonBrightnessDown, run, {.com = bridown}},

    {MOD,           	XK_h,      	move,  {.com=(char*[]){"move", "left"}, .i=30}},
    {MOD,           	XK_j,      	move,  {.com=(char*[]){"move", "down"}, .i=30}},
    {MOD,           	XK_k,      	move,  {.com=(char*[]){"move", "up"}, .i=30}},
    {MOD,           	XK_l,      	move,  {.com=(char*[]){"move", "right"}, .i=30}},
    {MOD|ShiftMask, 	XK_h,      	move,  {.com=(char*[]){"resize", "left"}, .i=30}},
    {MOD|ShiftMask, 	XK_j,      	move,  {.com=(char*[]){"resize", "down"}, .i=30}},
    {MOD|ShiftMask, 	XK_k,      	move,  {.com=(char*[]){"resize", "up"}, .i=30}},
    {MOD|ShiftMask, 	XK_l,      	move,  {.com=(char*[]){"resize", "right"}, .i=30}},

    {MOD,           	XK_Left,   	move,  {.com=(char*[]){"move", "left"}, .i=30}},
    {MOD,           	XK_Down,   	move,  {.com=(char*[]){"move", "down"}, .i=30}},
    {MOD,           	XK_Up,     	move,  {.com=(char*[]){"move", "up"}, .i=30}},
    {MOD,           	XK_Right,  	move,  {.com=(char*[]){"move", "right"}, .i=30}},
    {MOD|ShiftMask, 	XK_Left,   	move,  {.com=(char*[]){"resize", "left"}, .i=30}},
    {MOD|ShiftMask, 	XK_Down,   	move,  {.com=(char*[]){"resize", "down"}, .i=30}},
    {MOD|ShiftMask, 	XK_Up,     	move,  {.com=(char*[]){"resize", "up"}, .i=30}},
    {MOD|ShiftMask, 	XK_Right,  	move,  {.com=(char*[]){"resize", "right"}, .i=30}},

    {MOD,               XK_1, ws_go,     	{.i = 1}},
    {MOD|ShiftMask,     XK_1, win_to_ws, 	{.i = 1}},
    {MOD|ControlMask,   XK_1,ws_toggle, 	{.i = 1}},

    {MOD,               XK_2, ws_go,     	{.i = 2}},
    {MOD|ShiftMask,     XK_2, win_to_ws, 	{.i = 2}},
    {MOD|ControlMask,   XK_2,ws_toggle, 	{.i = 2}},

    {MOD,               XK_3, ws_go,     	{.i = 3}},
    {MOD|ShiftMask,     XK_3, win_to_ws, 	{.i = 3}},
    {MOD|ControlMask,   XK_3,ws_toggle, 	{.i = 3}},

    {MOD,               XK_4, ws_go,     	{.i = 4}},
    {MOD|ShiftMask,     XK_4, win_to_ws, 	{.i = 4}},
    {MOD|ControlMask,   XK_4,ws_toggle, 	{.i = 4}},

    {MOD,               XK_5, ws_go,     	{.i = 5}},
    {MOD|ShiftMask,     XK_5, win_to_ws, 	{.i = 5}},
    {MOD|ControlMask,   XK_5,ws_toggle, 	{.i = 5}},
    
    {MOD,               XK_0, ws_toggle_all, 	{.i = 0}},
};

#endif
