// SCHEMA for reading digital buttons
// 0 button down
// <0 button pressed
// >0 key repeat speed (in frames)

// you could function base and change this schema during game
// for different schemas e.g. you might want slow repeat for dpad in menus
// but continuous during game play
global.r_dpad = 0; // allows continuous movement
global.r_stickl = 0;
global.r_stickr = 0;
global.r_o = -1; // buttons with a 5 frame repeat
global.r_u = 5;
global.r_y = 5;
global.r_a = 5;
global.r_rs = 0; // other buttons continuous
global.r_ls = 0;
global.r_rst = 0;
global.r_lst = 0;
global.r_st = 0;
global.r_se = 0;

// for game join leave screen
global.register_button = "o";
global.unregister_button = "a";

// timers for key repeat speed
for(var i=0; i<80; i++){
    global.r_timers[i] = 0;
}

// index 0 is the keyboard and will be emulated
// index 1-4 are 4 connected pads
for(var i=0; i<=4; i++){
    globals_init_controller(i);
}
global.p_type[0] = GAMEPAD_KEYS; // first channel is always keys
global.controller_menu = 0; // index of player controlling menu (keyboard[0] always can)
global.seeking_gamepads = true; // only seek while you have to!
global.found_gamepads = 0; // total number of real pads I know about

// virtual player to actual gamepad mapping - when players join a new game
// this maps actual device channels to virtual players
global.vp[0] = GAMEPAD_NONE; 
global.vp[1] = GAMEPAD_NONE;
global.vp[2] = GAMEPAD_NONE;
global.vp[3] = GAMEPAD_NONE;