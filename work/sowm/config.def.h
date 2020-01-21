#ifndef CONFIG_H
#define CONFIG_H

#define MOD Mod4Mask

const char* menu[]    = {"dmenu_run",      0};
const char* term[]    = {"st",             0};
const char* scrot[]   = {"scr",            0};
const char* briup[]   = {"bri", "10", "+", 0};
const char* bridown[] = {"bri", "10", "-", 0};
const char* voldown[] = {"amixer", "sset", "Master", "5%-",         0};
const char* volup[]   = {"amixer", "sset", "Master", "5%+",         0};
const char* volmute[] = {"amixer", "sset", "Master", "toggle",      0};
const char* colors[]  = {"bud", "/home/goldie/Pictures/Wallpapers", 0};

static struct key keys[] = {
    {MOD,      XK_q,   win_kill,   {0}},
    {MOD,      XK_c,   win_center, {0}},
    {MOD,      XK_f,   win_fs,     {0}},

    {Mod1Mask,           XK_Tab, win_next,   {0}},
    {Mod1Mask|ShiftMask, XK_Tab, win_prev,   {0}},

    {MOD, XK_d,      run, {.com = menu}},
    {MOD, XK_w,      run, {.com = colors}},
    {MOD, XK_p,      run, {.com = scrot}},
    {MOD, XK_Return, run, {.com = term}},

    {MOD,           XK_h,      move,  {.com=(char*[]){"move", "left"}, .i=10}},
    {MOD,           XK_j,      move,  {.com=(char*[]){"move", "down"}, .i=10}},
    {MOD,           XK_k,      move,  {.com=(char*[]){"move", "up"}, .i=10}},
    {MOD,           XK_l,      move,  {.com=(char*[]){"move", "right"}, .i=10}},
    {MOD|ShiftMask, XK_h,      move,  {.com=(char*[]){"resize", "left"}, .i=10}},
    {MOD|ShiftMask, XK_j,      move,  {.com=(char*[]){"resize", "down"}, .i=10}},
    {MOD|ShiftMask, XK_k,      move,  {.com=(char*[]){"resize", "up"}, .i=10}},
    {MOD|ShiftMask, XK_l,      move,  {.com=(char*[]){"resize", "right"}, .i=10}},

    {0,   XF86XK_AudioLowerVolume,  run, {.com = voldown}},
    {0,   XF86XK_AudioRaiseVolume,  run, {.com = volup}},
    {0,   XF86XK_AudioMute,         run, {.com = volmute}},
    {0,   XF86XK_MonBrightnessUp,   run, {.com = briup}},
    {0,   XF86XK_MonBrightnessDown, run, {.com = bridown}},

    {MOD,           XK_1, ws_go,     {.i = 1}},
    {MOD|ShiftMask, XK_1, win_to_ws, {.i = 1}},
    {MOD|ControlMask,XK_1,ws_toggle, {.i = 1}},

    {MOD,           XK_2, ws_go,     {.i = 2}},
    {MOD|ShiftMask, XK_2, win_to_ws, {.i = 2}},
    {MOD|ControlMask,XK_1,ws_toggle, {.i = 2}},

    {MOD,           XK_3, ws_go,     {.i = 3}},
    {MOD|ShiftMask, XK_3, win_to_ws, {.i = 3}},
    {MOD|ControlMask,XK_1,ws_toggle, {.i = 3}},

    {MOD,           XK_4, ws_go,     {.i = 4}},
    {MOD|ShiftMask, XK_4, win_to_ws, {.i = 4}},
    {MOD|ControlMask,XK_1,ws_toggle, {.i = 4}},

    {MOD,           XK_5, ws_go,     {.i = 5}},
    {MOD|ShiftMask, XK_5, win_to_ws, {.i = 5}},
    {MOD|ControlMask,XK_1,ws_toggle, {.i = 5}},

    {MOD,           XK_6, ws_go,     {.i = 6}},
    {MOD|ShiftMask, XK_6, win_to_ws, {.i = 6}},
    {MOD|ControlMask,XK_1,ws_toggle, {.i = 6}},

    {MOD,           XK_0, ws_toggle_all, {.i = 0}},
};

#endif
