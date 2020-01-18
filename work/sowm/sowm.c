// sowm - An itsy bitsy floating window manager.

#include <X11/Xlib.h>
#include <X11/XF86keysym.h>
#include <X11/keysym.h>
#include <X11/XKBlib.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>
#include <stdio.h>

typedef struct {
    const char** com;
    const int i;
    const Window w;
} Arg;

struct key {
    unsigned int mod;
    KeySym keysym;
    void (*function)(const Arg arg);
    const Arg arg;
};

typedef struct client {
    struct client *next, *prev;
    int f, wx, wy;
    unsigned int ww, wh;
    Window w;
} client;

static void init();
static void button_press(XEvent *e);
static void button_release();
static void configure_request(XEvent *e);
static void key_press(XEvent *e);
static void map_request(XEvent *e);
static void notify_destroy(XEvent *e);
static void notify_enter(XEvent *e);
static void notify_motion(XEvent *e);
static void run(const Arg arg);
static void win_add(Window w);
static void win_center();
static void win_del(Window w);
static void win_fs();
static void win_kill();
static void win_prev();
static void win_next();
static void win_to_ws(const Arg arg);
static void ws_go(const Arg arg);
static void apply(int x, int y, int w, int h);
static void move(const Arg arg);
static void ws_toggle(const Arg arg);
static void ws_toggle_all(const Arg arg);
static int  xerror() { return 0;}

static client       *list = {0}, *ws_list[10] = {0}, *cur;
static int          ws = 1, sw, sh, wx, wy;
static unsigned int ww, wh;
static int			is_ws_enabled[10] = {0}; /* +1 the amount of ws */

static Display      *d;
static XButtonEvent mouse;

static void (*events[LASTEvent])(XEvent *e) = {
    [ButtonPress]      = button_press,
    [ButtonRelease]    = button_release,
    [ConfigureRequest] = configure_request,
    [KeyPress]         = key_press,
    [MapRequest]       = map_request,
    [DestroyNotify]    = notify_destroy,
    [EnterNotify]      = notify_enter,
    [MotionNotify]     = notify_motion
};

#include "config.h"

#define win        (client *t=0, *c=list; c && t!=list->prev; t=c, c=c->next)
#define ws_save(W) ws_list[W] = list
#define ws_sel(W)  list = ws_list[ws = W]

#define win_size(W, gx, gy, gw, gh) \
    XGetGeometry(d, W, &(Window){0}, gx, gy, gw, gh, \
                 &(unsigned int){0}, &(unsigned int){0})

void apply(int x,int y,int w,int h) {
    win_size(cur->w, &wx, &wy, &ww, &wh);
    XMoveResizeWindow(d, cur->w,
        wx + x,
        wy + y,
        ww + w,
				wh + h);
    win_size(cur->w, &wx, &wy, &ww, &wh);
}

void move(const Arg arg) {
	 if(arg.com[1]=="left") {
        apply((arg.com[0]=="resize")?arg.i:-arg.i, 0, (arg.com[0]=="resize")?-arg.i:0, 0);
    }
    else if(arg.com[1]=="right"){
        apply((arg.com[0]=="resize")?-arg.i:arg.i, 0, (arg.com[0]=="resize")?arg.i:0, 0);
    }
    else if(arg.com[1]=="up"){
        apply(0, (arg.com[0]=="resize")?arg.i:-arg.i, 0, (arg.com[0]=="resize")?-arg.i:0);
    }
    else if(arg.com[1]=="down"){
        apply(0, (arg.com[0]=="resize")?-arg.i:arg.i, 0, (arg.com[0]=="resize")?arg.i:0);
    }
}

void init() {
    Window *child;
    unsigned int nchild;
    XQueryTree(d, RootWindow(d, DefaultScreen(d)), &(Window){0},
        &(Window){0}, &child, &nchild);
    for(unsigned int i = 0; i < nchild; i++) {
        XSelectInput(d, child[i], StructureNotifyMask|EnterWindowMask);
        XMapWindow(d, child[i]);
        win_add(child[i]);
    }
}

void win_focus(client *c) {
    cur = c;
    XSetInputFocus(d, cur->w, RevertToParent, CurrentTime);
}

void notify_destroy(XEvent *e) {
    win_del(e->xdestroywindow.window);

    if (list) win_focus(list->prev);
}

void notify_enter(XEvent *e) {
    while(XCheckTypedEvent(d, EnterNotify, e));

    for win if (c->w == e->xcrossing.window) win_focus(c);
}

void notify_motion(XEvent *e) {
    if (!mouse.subwindow || cur->f) return;

    while(XCheckTypedEvent(d, MotionNotify, e));

    int xd = e->xbutton.x_root - mouse.x_root;
    int yd = e->xbutton.y_root - mouse.y_root;

    XMoveResizeWindow(d, mouse.subwindow,
        wx + (mouse.button == 1 ? xd : 0),
        wy + (mouse.button == 1 ? yd : 0),
        ww + (mouse.button == 3 ? xd : 0),
        wh + (mouse.button == 3 ? yd : 0));
}

void key_press(XEvent *e) {
    KeySym keysym = XkbKeycodeToKeysym(d, e->xkey.keycode, 0, 0);

    init();

    for (unsigned int i=0; i < sizeof(keys)/sizeof(*keys); ++i)
        if (keys[i].mod == e->xkey.state &&
            keys[i].keysym == keysym)
            keys[i].function(keys[i].arg);
}

void button_press(XEvent *e) {
    if (!e->xbutton.subwindow) return;

    win_size(e->xbutton.subwindow, &wx, &wy, &ww, &wh);
    XRaiseWindow(d, e->xbutton.subwindow);

    int sd = 0;
    if(e->xbutton.button == Button4) sd = WheelResizeStep;
    else if(e->xbutton.button == Button5) sd = -WheelResizeStep;

    XMoveResizeWindow(d, e->xbutton.subwindow,
        wx - sd,
        wy - sd,
        ww + sd*2,
        wh + sd*2);

    mouse = e->xbutton;
}

void button_release() {
    win_size(cur->w, &wx, &wy, &ww, &wh);
    mouse.subwindow = 0;
}

void win_add(Window w) {
    client *c;

    if (!(c = (client *) calloc(1, sizeof(client))))
        exit(1);

    c->w = w;

    if (list) {
        list->prev->next = c;
        c->prev          = list->prev;
        list->prev       = c;
        c->next          = list;

    } else {
        list = c;
        list->prev = list->next = list;
    }

    ws_save(ws);
}

void win_del(Window w) {
    client *x = 0;

    for win if (c->w == w) x = c;

    if (!list || !x)  return;
    if (x->prev == x) list = 0;
    if (list == x)    list = x->next;
    if (x->next)      x->next->prev = x->prev;
    if (x->prev)      x->prev->next = x->next;

    free(x);
    ws_save(ws);
}

void win_kill() {
    if (!cur) return;

    XEvent ev = { .type = ClientMessage };

    ev.xclient.window       = cur->w;
    ev.xclient.format       = 32;
    ev.xclient.message_type = XInternAtom(d, "WM_PROTOCOLS", True);
    ev.xclient.data.l[0]    = XInternAtom(d, "WM_DELETE_WINDOW", True);
    ev.xclient.data.l[1]    = CurrentTime;

    XSendEvent(d, cur->w, False, NoEventMask, &ev);
}

void win_center() {
    if (!cur) return;

    win_size(cur->w, &(int){0}, &(int){0}, &ww, &wh);

    XMoveWindow(d, cur->w, (sw - ww) / 2, (sh - wh) / 2);
}

void win_fs() {
    if (!cur) return;

    if ((cur->f = cur->f ? 0 : 1)) {
        win_size(cur->w, &cur->wx, &cur->wy, &cur->ww, &cur->wh);
        XMoveResizeWindow(d, cur->w, 0, 0, sw, sh);

    } else
        XMoveResizeWindow(d, cur->w, cur->wx, cur->wy, cur->ww, cur->wh);
}

void win_to_ws(const Arg arg) {
    int tmp = ws;

    if (arg.i == tmp) return;

    ws_sel(arg.i);
    win_add(cur->w);
    ws_save(arg.i);

    ws_sel(tmp);
    win_del(cur->w);
    XUnmapWindow(d, cur->w);
    ws_save(tmp);

    if (list) win_focus(list);
}

void win_prev() {
    if (!cur) return;

    XRaiseWindow(d, cur->prev->w);
    win_focus(cur->prev);
}

void win_next() {
    if (!cur) return;

    XRaiseWindow(d, cur->next->w);
    win_focus(cur->next);
}

void ws_go(const Arg arg) {
	int i;

    ws_save(ws);

	for (i = 1; i <= 9; i++) {
		if (i != arg.i) {
			ws_sel(i);
			if (list) for win XUnmapWindow(d, c->w);
			is_ws_enabled[i] = 0;
		}
	}
 

    ws_sel(arg.i);
    if (list) for win XMapWindow(d, c->w);
    if (list) win_focus(list); else cur = 0;
}

void
ws_toggle(const Arg arg)
{
	int i, tmp = -1;

	if (arg.i == ws) {
		for (i = 1; i <= 9; i++) {
			if (is_ws_enabled[i] && i != ws) {
				tmp = i;
				break;
			}
		}

		if (tmp > 0)
			ws_sel(tmp);
		else
			return;
	}

	tmp = ws;

	ws_sel(arg.i);
	if (is_ws_enabled[arg.i]) {
		is_ws_enabled[arg.i] = 0;
		if (list) for win XUnmapWindow(d, c->w);
	} else {
		is_ws_enabled[arg.i] = 1;
		if (list) for win XMapWindow(d, c->w);
	}
	ws_sel(tmp);
}

void
ws_toggle_all(const Arg arg)
{
	int i, tmp = ws;
	for (i = 1; i <= 6; i++) {
		ws_sel(i);
		if (list) for win XMapWindow(d, c->w);
		is_ws_enabled[i] = 1;
	}
	ws_sel(tmp);
}

void configure_request(XEvent *e) {
    XConfigureRequestEvent *ev = &e->xconfigurerequest;

    XConfigureWindow(d, ev->window, ev->value_mask, &(XWindowChanges) {
        .x          = ev->x,
        .y          = ev->y,
        .width      = ev->width,
        .height     = ev->height,
        .sibling    = ev->above,
        .stack_mode = ev->detail
    });
}

void map_request(XEvent *e) {
    Window w = e->xmaprequest.window;

    XSelectInput(d, w, StructureNotifyMask|EnterWindowMask);
    win_size(w, &wx, &wy, &ww, &wh);
    win_add(w);
    cur = list->prev;

    if (wx + wy == 0) win_center();

    XMapWindow(d, w);
    win_focus(list->prev);
}

void run(const Arg arg) {
    if (fork()) return;
    if (d) close(ConnectionNumber(d));

    setsid();
    execvp((char*)arg.com[0], (char**)arg.com);
}

int main(void) {
    XEvent ev;

    if (!(d = XOpenDisplay(0))) exit(1);

    signal(SIGCHLD, SIG_IGN);
    XSetErrorHandler(xerror);

    int s       = DefaultScreen(d);
    Window root = RootWindow(d, s);
    sw          = XDisplayWidth(d, s);
    sh          = XDisplayHeight(d, s);

    XSelectInput(d,  root, SubstructureRedirectMask);
    XDefineCursor(d, root, XCreateFontCursor(d, 68));

    for (unsigned int i=0; i < sizeof(keys)/sizeof(*keys); ++i)
        XGrabKey(d, XKeysymToKeycode(d, keys[i].keysym), keys[i].mod,
                 root, True, GrabModeAsync, GrabModeAsync);

    for (int i=1; i<6; i++)
        XGrabButton(d, i, MOD, root, True,
            ButtonPressMask|ButtonReleaseMask|PointerMotionMask,
            GrabModeAsync, GrabModeAsync, 0, 0);

    while (1 && !XNextEvent(d, &ev))
        if (events[ev.type]) events[ev.type](&ev);
}
