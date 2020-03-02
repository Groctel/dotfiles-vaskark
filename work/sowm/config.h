#ifndef CONFIG_H
#define CONFIG_H

#define MOD Mod4Mask

const char* dmenu[]	= {"dmenu.sh",      0};
const char* rofi[]	= {"rofi", "-show", "drun",      0};
const char* term[]	= {"kitty",             0};
const char* nmd[] 	= {"networkmanager_dmenu", 0};
const char* shot[]	= {"screenshot.sh", "full",            0};
const char* wshot[] 	= {"screenshot.sh", "window", 0};
const char* briup[] 	= {"light", "-A", "5", 0};
const char* bridown[] 	= {"light", "-U", "5", 0};
const char* voldown[] 	= {"pactl", "set-sink-volume", "@DEFAULT_SINK@", "-5%",         0};
const char* volup[] 	= {"pactl", "set-sink-volume", "@DEFAULT_SINK@", "+5%",         0};
const char* volmute[] 	= {"pactl", "set-sink-mute", "@DEFAULT_SINK@", "toggle",      0};

const char* lock[] 	= {"betterlockscreen", "-l", "pixel", 0};
const char* nautilus[] 	= {"nautilus", 0};
const char* chrome[] 	= {"google-chrome", 0};
const char* music[] 	= {"kitty", "-e", "ncmpcpp", 0};

const char* viz[]	= {"viz.sh", 0};
const char* prev[]	= {"mpc", "prev", 0};
const char* next[]	= {"mpc", "next", 0};
const char* toggle[]	= {"mpc", "toggle", 0};

const char* polybar_toggle[] = {"polybar-toggle.sh", 0};

const char* w0[] 	= {"sxiv", "/home/jason/Pictures/favs/", "-t", 0};
const char* w1[] 	= {"wal.sh", 0};
const char* w2[] 	= {"wal", "--theme", "random", 0};
const char* wf[] 	= {"wal", "--theme", "dkeg-skigh", 0}; 
const char* wr[] 	= {"wal", "-R", 0};

const char* quit[] 	= {"killall", "sowm", 0};
const char* reboot[] 	= {"systemctl", "reboot", 0};
const char* shutdown[] 	= {"systemctl", "-i", "poweroff", 0};

static struct key keys[] = {
    {MOD,      XK_q,   win_kill,   {0}},
    {MOD,      XK_c,   win_center, {0}},
    {MOD,      XK_f,   win_fs,     {0}},

    {Mod1Mask,           XK_Tab, win_next,   {0}},
    {Mod1Mask|ShiftMask, XK_Tab, win_prev,   {0}},

    {MOD,	        XK_x,	   	run, {.com = dmenu}},
    {MOD,		XK_d,		run, {.com = rofi}},
    {MOD,       	XK_n,		run, {.com = nmd}},
    {MOD,           	XK_Print,      	run, {.com = shot}},
    {MOD|ShiftMask,     XK_Print,      	run, {.com = wshot}},
    {MOD,           	XK_Return, 	run, {.com = term}},

    {MOD, 		XK_Escape, 	run, {.com = lock}},
    {MOD, 		XK_F1,     	run, {.com = nautilus}},
    {MOD, 		XK_F2,     	run, {.com = chrome}},
    {MOD, 		XK_F3,     	run, {.com = music}},

    {Mod1Mask,		XK_F9,	        run, {.com = viz}},
    {Mod1Mask,		XK_F10,		run, {.com = prev}},
    {Mod1Mask,		XK_F11,		run, {.com = toggle}},
    {Mod1Mask,		XK_F12 ,	run, {.com = next}},

    {MOD,		XK_p,		run, {.com = polybar_toggle}},

    {MOD,               XK_F8,          run, {.com = w0}},
    {MOD,		XK_F9,		run, {.com = w1}},
    {MOD,		XK_F10,		run, {.com = w2}},
    {MOD,		XK_F11,		run, {.com = wf}},
    {MOD,               XK_F12,         run, {.com = wr}},

    {MOD, 		XK_Delete, 	run, {.com = quit}},
    {MOD|ShiftMask,	XK_Delete,	run, {.com = reboot}},
    {MOD|ControlMask,	XK_Delete,	run, {.com = shutdown}},

    {MOD,           XK_k,  win_move,  {.com = (const char*[]){"move",   "n"}, .i = 30}},
    {MOD,           XK_j,  win_move,  {.com = (const char*[]){"move",   "s"}, .i = 30}},
    {MOD,           XK_l,  win_move,  {.com = (const char*[]){"move",   "e"}, .i = 30}},
    {MOD,           XK_h,  win_move,  {.com = (const char*[]){"move",   "w"}, .i = 30}},

    {MOD,           XK_Up,  win_move,  {.com = (const char*[]){"move",   "n"}, .i = 30}},
    {MOD,           XK_Down,  win_move,  {.com = (const char*[]){"move",   "s"}, .i = 30}},
    {MOD,           XK_Right,  win_move,  {.com = (const char*[]){"move",   "e"}, .i = 30}},
    {MOD,           XK_Left,  win_move,  {.com = (const char*[]){"move",   "w"}, .i = 30}},

    {MOD|ShiftMask, XK_k,  win_move,  {.com = (const char*[]){"resize", "n"}, .i = 30}},
    {MOD|ShiftMask, XK_j,  win_move,  {.com = (const char*[]){"resize", "s"}, .i = 30}},
    {MOD|ShiftMask, XK_l,  win_move,  {.com = (const char*[]){"resize", "e"}, .i = 30}},
    {MOD|ShiftMask, XK_h,  win_move,  {.com = (const char*[]){"resize", "w"}, .i = 30}},

    {MOD|ShiftMask, XK_Up,  win_move,  {.com = (const char*[]){"resize", "n"}, .i = 30}},
    {MOD|ShiftMask, XK_Down,  win_move,  {.com = (const char*[]){"resize", "s"}, .i = 30}},
    {MOD|ShiftMask, XK_Right,  win_move,  {.com = (const char*[]){"resize", "e"}, .i = 30}},
    {MOD|ShiftMask, XK_Left,  win_move,  {.com = (const char*[]){"resize", "w"}, .i = 30}},

    {0,   XF86XK_AudioLowerVolume,  run, {.com = voldown}},
    {0,   XF86XK_AudioRaiseVolume,  run, {.com = volup}},
    {0,   XF86XK_AudioMute,         run, {.com = volmute}},
    {0,   XF86XK_MonBrightnessUp,   run, {.com = briup}},
    {0,   XF86XK_MonBrightnessDown, run, {.com = bridown}},

    {MOD,           XK_1, ws_go,     {.i = 1}},
    {MOD|ShiftMask, XK_1, win_to_ws, {.i = 1}},
    {MOD,           XK_2, ws_go,     {.i = 2}},
    {MOD|ShiftMask, XK_2, win_to_ws, {.i = 2}},
    {MOD,           XK_3, ws_go,     {.i = 3}},
    {MOD|ShiftMask, XK_3, win_to_ws, {.i = 3}},
    {MOD,           XK_4, ws_go,     {.i = 4}},
    {MOD|ShiftMask, XK_4, win_to_ws, {.i = 4}},
    {MOD,           XK_5, ws_go,     {.i = 5}},
    {MOD|ShiftMask, XK_5, win_to_ws, {.i = 5}},
};

#endif
