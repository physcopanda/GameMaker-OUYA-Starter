/// keyboard_to_gamepad(player)
// emulates gamepad with keyboard
// always stores results for player 0 and copies them
// to player(argument0) too
// allows p0 to be used for menus always
// return true if any control was detected

var player = argument0;
var any = false;
var timer = 0;

// read keyboard honouring our control schema defined in globals_init_controllers
global.p_up[player] = keyboard_read(global.key_up, global.r_dpad, timer++); any |= global.p_up[player];
global.p_left[player] = keyboard_read(global.key_left, global.r_dpad, timer++); any |= global.p_left[player];
global.p_down[player] = keyboard_read(global.key_down, global.r_dpad, timer++); any |= global.p_down[player];
global.p_right[player] = keyboard_read(global.key_right, global.r_dpad, timer++); any |= global.p_right[player];
global.p_stickl[player] = keyboard_read(global.key_stickl, global.r_stickl, timer++); any |= global.p_stickl[player];
global.p_stickr[player] = keyboard_read(global.key_stickr, global.r_stickr, timer++); any |= global.p_stickr[player];
global.p_o[player] = keyboard_read(global.key_o, global.r_o, timer++); any |= global.p_o[player];
global.p_u[player] = keyboard_read(global.key_u, global.r_u, timer++); any |= global.p_u[player];
global.p_y[player] = keyboard_read(global.key_y, global.r_y, timer++); any |= global.p_y[player];
global.p_a[player] = keyboard_read(global.key_a, global.r_a, timer++); any |= global.p_a[player];
global.p_rs[player] = keyboard_read(global.key_rs, global.r_rs, timer++); any |= global.p_rs[player];
global.p_ls[player] = keyboard_read(global.key_ls, global.r_ls, timer++); any |= global.p_ls[player];
global.p_rst[player] = keyboard_read(global.key_rst, global.r_rst, timer++); any |= global.p_rst[player];
global.p_lst[player] = keyboard_read(global.key_lst, global.r_lst, timer++); any |= global.p_lst[player];
global.p_st[player] = keyboard_read(global.key_st, global.r_st, timer++); any |= global.p_st[player];
global.p_se[player] = keyboard_read(global.key_se, global.r_se, timer++); any |= global.p_se[player];
// keyboard does not simulate analogue at all!

return any;