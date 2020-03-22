/* See LICENSE file for copyright and license details. */

/* svolume keys */
#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const unsigned int gappx    = 6;        /* gaps between windows */
static const int horizpadbar        = 0;        /* horizontal padding for statusbar */
static const int vertpadbar         = 12;        /* vertical padding for statusbar */
static const char *fonts[]          = { "scientifica:bold:size=11", "Symbols Nerd Font:size=8" };
static const char dmenufont[]       = "scientifica-11:bold";
static const unsigned int baralpha = 0xee;
static const unsigned int borderalpha = 0xdd;
#include "/home/jason/.cache/wal/colors-wal-dwm.h"
static const unsigned int alphas[][3]      = {
	/*               fg      bg        border     */
	[SchemeNorm] = { OPAQUE, baralpha, borderalpha },
	[SchemeSel]  = { OPAQUE, baralpha, borderalpha },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };
/*static const char *tags[] = { "", "", "", "", "", "", "", "", "" };*/ /* SNF */
/*static const char *tags[] = { "", "", "", "", "", "", "", "", "" };*/ /* Siji */

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     iscentered     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            0,             1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,             0,           -1 },
	{ "St",	      NULL,       NULL,       0,            1,             1,           -1 },
	{ "kitty",    NULL,       NULL,       0,            1,             0,           -1 }, 	
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

#include "layouts.c"
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "-T-",      tile },    /* first entry is default */
	{ "-F-",      NULL },    /* no layout function means floating behavior */
	{ "-M-",      monocle },
	{ "-G-",      grid },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-i", "-h", "28", "-p", "run:", "-fn", dmenufont, "-nb", norm_bg, "-nf", norm_fg, "-sb", sel_bg, "-sf", sel_fg, NULL };
static const char *roficmd[] = { "rofi", "-show", "drun", NULL };
static const char *termcmd[] = { "urxvt", NULL };
const char* nautilus[] = {"nautilus", 0};
const char* chrome[] = {"google-chrome", 0};
const char* music[] = {"kitty", "-e", "ncmpcpp", 0};
static const char *lock[] = { "betterlockscreen", "-l", "pixel", NULL };
const char* w0[] = {"sxiv", "/home/jason/Pictures/favs/", "-t", "-g", "630x600+60+60", 0};
const char* w1[] = {"wal", "-i", "/home/jason/Pictures/favs/", 0};
const char* w2[] = {"wal", "--theme", "random", 0};
const char* wf[] = {"wal", "--theme", "dkeg-simplicity", 0}; 
const char* wr[] = {"wal", "-R", 0};
static const char *upvol[] = { "/usr/bin/pactl", "set-sink-volume", "@DEFAULT_SINK@", "+5%",     NULL };
static const char *downvol[] = { "/usr/bin/pactl", "set-sink-volume", "@DEFAULT_SINK@", "-5%",     NULL };
static const char *mutevol[] = { "/usr/bin/pactl", "set-sink-mute",   "@DEFAULT_SINK@", "toggle",  NULL };
const char* prev[] = {"mpc", "prev", 0};
const char* next[] = {"mpc", "next", 0};
const char* toggle[] = {"mpc", "toggle", 0};

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_x,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_x,      spawn,          {.v = roficmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY|ShiftMask,             XK_j,      rotatestack,    {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,      rotatestack,    {.i = -1 } },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_z,      zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_g,      setlayout,      {.v = &layouts[3]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },

	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)

        { MODKEY,			XK_Escape,      spawn,	        {.v = lock } },
        { MODKEY, 			XK_F1,     	spawn, 		{.v = nautilus}},
        { MODKEY, 			XK_F2,     	spawn, 		{.v = chrome}},
        { MODKEY, 			XK_F3,     	spawn, 		{.v = music}},

	{ MODKEY,               	XK_F8,          spawn,     {.v = w0 } },
        { MODKEY,			XK_F9,		spawn,     {.v = w1 } },
        { MODKEY,			XK_F10,		spawn,     {.v = w2 } },
        { MODKEY,			XK_F11,		spawn,     {.v = wf } },
        { MODKEY,               	XK_F12,         spawn,     {.v = wr } },

	{ 0,                            XF86XK_AudioLowerVolume,   spawn, {.v = downvol } },
	{ 0,                            XF86XK_AudioMute,          spawn, {.v = mutevol } },
	{ 0,                            XF86XK_AudioRaiseVolume,   spawn, {.v = upvol   } },

	{ Mod1Mask,			XK_F10,	   spawn,	   {.v = prev } },
	{ Mod1Mask,			XK_F11,	   spawn,	   {.v = toggle } },
	{ Mod1Mask,			XK_F12,	   spawn,	   {.v = next } },

	{ MODKEY,                       XK_minus,  setgaps,        {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_plus,   setgaps,        {.i = +1 } },
	{ MODKEY,                       XK_equal,  setgaps,        {.i = 0  } },

	{ MODKEY,                       XK_Delete,      quit,      {0} },
	{ MODKEY|ShiftMask,             XK_Delete,      quit,      {1} }, 
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

