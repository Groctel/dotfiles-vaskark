#ifndef CONFIG_H
#define CONFIG_H

#define MOD Mod4Mask

const char* menu[]    = {"dmenu_run",      0};
const char* rofi[]    = {"rofi", "-show", "drun", "-theme", "themes/drun.rasi",      0};
const char* term[]    = {"kitty",             0};
const char* sshot[]   = {"screenshot.sh", "full",            0};
const char* briup[]   = {"light", "-A", "5", 0};
const char* bridown[] = {"light", "-U", "5", 0};
const char* voldown[] = {"amixer", "sset", "Master", "5%-",         0};
const char* volup[]   = {"amixer", "sset", "Master", "5%+",         0};
const char* volmute[] = {"amixer", "sset", "Master", "toggle",      0};

const char* lock[] = {"betterlockscreen", "-l", "pixel", 0};
const char* nautilus[] = {"nautilus", 0};
const char* chrome[] = {"google-chrome", 0};
const char* music[] = {"kitty", "-e", "ncmpcpp", 0};

const char* quit[] = {"killall", "sowm.sh", 0};

static struct key keys[] = {
    {MOD,      		XK_q,   	win_kill,   {0}},
    {MOD,      		XK_c,   	win_center, {0}},
    {MOD,      		XK_f,   	win_fs,     {0}},
    {Mod1Mask, 		XK_Tab, 	win_next,   {0}},

    {MOD|ShiftMask,	XK_d,	   	run, {.com = menu}},
    {MOD, 	    	XK_d,      	run, {.com = rofi}},
    {MOD,           	XK_p,      	run, {.com = sshot}},
    {MOD,           	XK_Return, 	run, {.com = term}},

    {MOD, 		XK_Escape, 	run, {.com = lock}},
    {MOD, 		XK_F1,     	run, {.com = nautilus}},
    {MOD, 		XK_F2,     	run, {.com = chrome}},
    {MOD, 		XK_F3,     	run, {.com = music}},

    {MOD, 		XK_Delete, 	run, {.com = quit}},

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
    {MOD,           XK_6, ws_go,     {.i = 6}},
    {MOD|ShiftMask, XK_6, win_to_ws, {.i = 6}},
};

#endif
