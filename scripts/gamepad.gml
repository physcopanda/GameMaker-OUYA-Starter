/// gamepad(player_id, dev)
// reads player controls for a player_id from a given device

var player = argument0;
var dev = argument1;
var timer = player<<4; // base in out timers array for strobbing input
var any = false; // return var

// only read a gamepad if one was detected!
if(dev != GAMEPAD_NONE){
    // if comms exists
    if(gamepad_is_connected(dev)){
        global.p_up[player] = gamepad_read(dev, gp_padu, global.r_dpad, timer++); any |= global.p_up[player];
        global.p_left[player] = gamepad_read(dev, gp_padl, global.r_dpad, timer++); any |= global.p_left[player];
        global.p_down[player] = gamepad_read(dev, gp_padd, global.r_dpad, timer++); any |= global.p_down[player];
        global.p_right[player] = gamepad_read(dev, gp_padr, global.r_dpad, timer++); any |= global.p_right[player];
        global.p_stickl[player] = gamepad_read(dev, gp_stickl, global.r_stickl, timer++); any |= global.p_stickl[player];
        global.p_stickr[player] = gamepad_read(dev, gp_stickr, global.r_stickr, timer++); any |= global.p_stickr[player];
        global.p_o[player] = gamepad_read(dev, gp_face1, global.r_o, timer++); any |= global.p_o[player];
        global.p_u[player] = gamepad_read(dev, gp_face3, global.r_u, timer++); any |= global.p_u[player];
        global.p_y[player] = gamepad_read(dev, gp_face4, global.r_y, timer++); any |= global.p_y[player];
        global.p_a[player] = gamepad_read(dev, gp_face2, global.r_a, timer++); any |= global.p_a[player];
        global.p_rs[player] = gamepad_read(dev, gp_shoulderr, global.r_rs, timer++); any |= global.p_rs[player];
        global.p_ls[player] = gamepad_read(dev, gp_shoulderl, global.r_ls, timer++); any |= global.p_ls[player];
        global.p_rst[player] = gamepad_read(dev, gp_shoulderrb, global.r_rst, timer++); any |= global.p_rst[player];
        global.p_lst[player] = gamepad_read(dev, gp_shoulderlb, global.r_lst, timer++); any |= global.p_lst[player];
        global.p_st[player] = gamepad_read(dev, gp_start, global.r_st, timer++); any |= global.p_st[player];
        global.p_se[player] = gamepad_read(dev, gp_select, global.r_se, timer++); any |= global.p_se[player];
        
        // analogue are just continuos read so no timers
        // if input is twice the magnitude of the deadzone then return true
        global.p_axislv[player] = gamepad_axis_value(dev, gp_axislv); any |= abs(global.p_axislv[player]) > ANALOGUE_DEADZONE*2;
        global.p_axislh[player] = gamepad_axis_value(dev, gp_axislh); any |= abs(global.p_axislh[player]) > ANALOGUE_DEADZONE*2;
        global.p_axisrv[player] = gamepad_axis_value(dev, gp_axisrv); any |= abs(global.p_axisrv[player]) > ANALOGUE_DEADZONE*2;
        global.p_axisrh[player] = gamepad_axis_value(dev, gp_axisrh); any |= abs(global.p_axisrh[player]) > ANALOGUE_DEADZONE*2;
        
    } else {
        // register comms lost if we had any
        if(global.p[player] != GAMEPAD_NONE){
            global.found_gamepads = max(0, global.found_gamepads-1);
            global.p_type[player] = GAMEPAD_UNKNOWN;
            global.p[player] = GAMEPAD_NONE;
        }
        // this stops small analogue values getting stored into unregistered controllers
        global.p_axislv[player] = 0;
        global.p_axislh[player] = 0;
        global.p_axisrv[player] = 0;
        global.p_axisrh[player] = 0;
    }
}
return any;