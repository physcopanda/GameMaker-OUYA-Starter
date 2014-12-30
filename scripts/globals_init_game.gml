// Init all game variables here - this happens ONCE only
ini_open('config.ini');

// DISPLAY VARS
if(os_type == os_windows){
    global.vdu_scale = ini_read_real('vdu', 'scale', 1); // - loaded in config.ini
} else {
    global.vdu_scale = 0;
}
global.vdu_vsync = ini_read_real('vdu', 'vsync', 0);
global.ww = 640;
global.hh = 360;
global.hww = global.ww>>1;
global.hhh = global.hh>>1;

// SCREEN SHAKE VARS
// max screen shake
global.shake_max = 0;
global.shaking = false;
global.surfx = 0;
global.surfy = 0;

// KEYS - load or default
global.key_up = ini_read_real('keys', 'up', vk_up);
global.key_left = ini_read_real('keys', 'left', vk_left);
global.key_down = ini_read_real('keys', 'down', vk_down);
global.key_right = ini_read_real('keys', 'right', vk_right);
global.key_stickl = ini_read_real('keys', 'stickl', ord('1'));
global.key_stickr = ini_read_real('keys', 'stickr', ord('2'));
global.key_o = ini_read_real('keys', 'o', ord('O'));
global.key_u = ini_read_real('keys', 'u', ord('U'));
global.key_y = ini_read_real('keys', 'y', ord('Y'));
global.key_a = ini_read_real('keys', 'a', ord('A'));
global.key_rs = ini_read_real('keys', 'rs', ord('4'));
global.key_ls = ini_read_real('keys', 'ls', ord('3'));
global.key_rst = ini_read_real('keys', 'rst', vk_ralt);
global.key_lst = ini_read_real('keys', 'lst', vk_lalt);
global.key_st = ini_read_real('keys', 'st', vk_return);
global.key_se = ini_read_real('keys', 'se', vk_space);

// global interface style - OUYA/XBOX/KEYS/...
global.control_interface = "OUYA";

/// FONTS
global.font[0] = font_add_sprite_ext(spr_font_c64, "@abcdefghijklmnopqrstuvwxyz[£] !"+'"'+"#$%&'()*+,-./0123456789:;<=>?ABCDEFGHIJKLMNOPQRSTUVWXYZ", false, 0);
global.font_big[0] = font_add_sprite_ext(spr_font_c64_big, "@abcdefghijklmnopqrstuvwxyz[£] !"+'"'+"#$%&'()*+,-./0123456789:;<=>?ABCDEFGHIJKLMNOPQRSTUVWXYZ", false, 0);

// HIGHSCORE VARS
//global.game_highscore_names = ds_list_create();
//global.game_highscore_scores = ds_list_create();
//global.game_highscore_p1 = 0;
//global.game_highscore_p2 = 0;
//global.game_highscore_p3 = 0;
//global.game_highscore_p4 = 0;
//global.callsign_p1 = ini_read_real('profile', 'callsign_p1', "PLAYER1");
//global.callsign_p2 = ini_read_real('profile', 'callsign_p2', "PLAYER2");
//global.callsign_p3 = ini_read_real('profile', 'callsign_p3', "PLAYER3");
//global.callsign_p4 = ini_read_real('profile', 'callsign_p4', "PLAYER4");

// ACHIEVEMENT VARIABLES

// PLAYING NOW!
global.playing = false;

ini_close();