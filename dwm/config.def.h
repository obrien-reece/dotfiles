/* See LICENSE file for copyright and license details. */

#include "/home/obrien/Downloads/dotfiles/dwm/themes/redish.h"

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int gappx     = 5;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int swallowfloating    = 0;        /* 1 means swallow floating windows by default */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=10" };
static const char dmenufont[]       = "monospace:size=10";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

typedef struct {
	const char *name;
	const void *cmd;
} Sp;
const char *spcmd1[] = {"kitty", "-n", "kittyscratch", "-g", "120x74", "--override", "remember_window_size=no", NULL };
static Sp scratchpads[] = {
	/* name          cmd  */
	{"kittyscratch",      spcmd1},
};

/*volume*/
#include <X11/XF86keysym.h>
/* volume keys*/
static const char *upvol[] = { "/usr/bin/pactl", "set-sink-volume", "0", "+5%", NULL };
static const char *downvol[] = { "/usr/bin/pactl", "set-sink-volume", "0", "-5%", NULL };
static const char *mutevol[] = { "/usr/bin/pactl", "set-sink-mute", "0", "toggle", NULL };

/* Control Media Players */
static const char *medplaypausecmd[] = { "playerctl", "play-pause", NULL };
static const char *mednextcmd[] = { "playerctl", "next", NULL };
static const char *medprevcmd[] = { "playerctl", "previous", NULL };

static const char *const autostart[] = {
	"google-chrome-stable", NULL,
	"thunderbird", NULL,
	"qbittorrent", NULL,
	"brave", NULL,
	// "telegram-desktop", NULL,
	"spotify", NULL,
	NULL /* terminate */
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };
static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class                      instance                      title                     tags mask     isfloating        isterminal      noswallow     monitor */
	{ "Brave-browser",            "brave-browser",              NULL,                     1 << 0,       0,                0,              0,            -1 },
	{ "discord",			            "discord",								    NULL,                     1 << 3,       0,                0,              0,            -1 },
	{ "Vivaldi-stable",           "vivaldi-stable",             NULL,                     1 << 0,       0,                0,              0,            -1 },
	{ "kitty",                    "kitty",	       						 NULL, 	                  0,            0,                1,              0,            -1 },
	{ NULL,                       "kittyscratch",							 NULL, 	                  SPTAG(0),     1,                1,              0,            -1 },
	{ "Thunar",	                 "thunar",                     NULL,                     0,            1,                0,              0,            -1 },
	{ "Motrix",                   "motrix",                     NULL,                     1 << 7,       0,                0,              0,            -1 },
	{ "Google-chrome",            "google-chrome",              NULL,                     1 << 0,       0,                0,              0,            -1 },
	{ "TelegramDesktop",          "telegram-desktop",           NULL,                     1 << 4,       0,                0,              0,            -1 },
	{ "thunderbird",              "Mail",                       NULL,                     1 << 6,       0,                0,              0,            -1 },
	{ "qBittorrent",              "qbittorrent",                NULL,                     1 << 7,       0,                0,              0,            -1 },
	{ "Spotify",                  "spotify",                    NULL,                     1 << 2,       0,                0,              0,            -1 },
	{ "Nitrogen",                 NULL,                         NULL,                     1 << 5,       1,                0,              0,            -1 },
	{ NULL,                       NULL,                         "Network Connections",    0,            1,                0,              0,            -1 },
	{ "Windscribe2",              "windscribe",                 NULL,                     0,            1,                0,              0,            -1 },
	{ NULL,                       "simplescreenrecorder",       NULL,                     0,            1,                0,              0,            -1 },
	{ "jetbrains-phpstorm",       "jetbrains-phpstorm",         NULL,                     1 << 5,       0,                0,              0,            -1 },
	{ "firefox",                  "Navigator",                  NULL,                     1 << 8,       0,                0,              0,            -1 },
	};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
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
static const char *dmenucmd[] = { "dmenu_run", "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "kitty", NULL };

#include "movestack.c"
#include "exitdwm.c"

static const char *blurlock[] = { "/home/obrien/.config/dwm/scripts/blur-lock", NULL };

static const Key keys[] = {

  /*Volume*/ 
  { 0, XF86XK_AudioLowerVolume, spawn, {.v = downvol} },
  { 0, XF86XK_AudioMute, spawn, {.v = mutevol }},
  { 0, XF86XK_AudioRaiseVolume, spawn, {.v = upvol} },

/* Keybindings for Media play/pause/next/previous */
{ 0, XF86XK_AudioPlay, spawn, {.v = medplaypausecmd } },
{ 0, XF86XK_AudioNext, spawn, {.v = mednextcmd } },
{ 0, XF86XK_AudioPrev, spawn, {.v = medprevcmd } },

  /*Custom scripts*/
  { MODKEY|ShiftMask,             XK_l,      spawn,          {.v = blurlock } },
	{ MODKEY|ShiftMask,             XK_e,      exitdwm,       {0} },

	{ MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
  
  /*Move stack around*/ 
  { MODKEY,                       XK_j,      movestack,      {.i = +1 } },
	{ MODKEY,                       XK_k,      movestack,      {.i = -1 } },

	{ MODKEY|ShiftMask,             XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_p,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
  { MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
/*{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },*/
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY|ShiftMask,             XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,					             XK_f,      togglefullscr,  {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY,                       XK_minus,  setgaps,        {.i = -1 } },
	{ MODKEY,                       XK_equal,  setgaps,        {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_equal,  setgaps,        {.i = 0  } },
  { MODKEY,            	       	XK_Return, togglescratch,  {.ui = 0 } },

	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
	{ MODKEY|ControlMask|ShiftMask, XK_q,      quit,           {1} }, 
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button1,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
