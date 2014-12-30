// gamepad_seek(player)
// trys to register a device id for a player
// if input was found returns true else false

var any = false;
var player = argument0;

//show_debug_message("gamepad_seek " + string(player));

for(var i = 0; i < DEVICE_ID_MAX; i++){
    // skip id's if assigned to other players
    if(player == 1){
        if(global.p[2] == i || global.p[3] == i || global.p[4] == i) continue;
    }
    if(player == 2){
        if(global.p[1] == i || global.p[3] == i || global.p[4] == i) continue;
    }
    if(player == 3){
        if(global.p[1] == i || global.p[2] == i || global.p[4] == i) continue;
    }
    if(player == 4){
        if(global.p[1] == i || global.p[2] == i || global.p[3] == i) continue;
    }
    // if we detect input on this channel then break the loop 
    any = gamepad(player, i);
    if(any){
        break;
    }
}
// if input was detected, store the type of controller
// and device id registered to the player
if(any){
    // register device
    global.found_gamepads++;
    //show_debug_message("found_gampads = "+string(global.found_gamepads));
    global.p[player] = i;
    // get type - you could use this to adapt display content
    // to fit with controller types
    var desc = gamepad_get_description(i);
    if(string_pos("OUYA", desc)!=false){
        global.p_type[player] = GAMEPAD_OUYA;
    } else if(string_pos("Xbox", desc)!=false){
        global.p_type[player] = GAMEPAD_XBOX;
    } else if(string_pos("Amazon Fire TV Controller", desc)!=false){
        global.p_type[player] = GAMEPAD_AMAZON;
    } else {
        global.p_type[player] = GAMEPAD_UNKNOWN;
    }    
    //show_debug_message("found " + gamepad_get_description(i) + " on channel " + string(i));
    return true;
}

//show_debug_message("no input");

global.p[player] = GAMEPAD_NONE;
global.p_type[player] = GAMEPAD_UNKNOWN;
return false;