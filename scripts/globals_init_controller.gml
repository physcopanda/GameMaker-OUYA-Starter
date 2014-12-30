/// globals_init_controller(channel);
// clear input for this controller
var i = argument0;
global.p[i] = GAMEPAD_NONE; // id of connected pad
global.p_type[i] = GAMEPAD_UNKNOWN; // ouya/xbox/key emulation/other
global.p_up[i] = false;
global.p_down[i] = false;
global.p_right[i] = false;
global.p_left[i] = false;
global.p_axislv[i] = false;
global.p_axislh[i] = false;
global.p_stickl[i] = false;
global.p_axisrv[i] = false;
global.p_axisrh[i] = false;
global.p_stickr[i] = false;
global.p_o[i] = false;
global.p_u[i] = false;
global.p_y[i] = false;
global.p_a[i] = false;
global.p_rs[i] = false; // right shoulder
global.p_ls[i] = false; // left shoulder
global.p_rst[i] = false; // right shoulder trigger
global.p_lst[i] = false; // left shoulder trigger
global.p_st[i] = false; // start
global.p_se[i] = false; // select