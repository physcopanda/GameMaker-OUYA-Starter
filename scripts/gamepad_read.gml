/// gamepad_read(device, button, schema, timer)
// device is the pads id
// button is the button code we are checking for
// store_var is the global variable we are storing true on read
// schema is < 0 for read once on button hold
// schema is = 0 for continous read on button hold
// schema is > 0 for key repeat read (frame delay)

var device = argument0;
var button = argument1;
var schema = argument2;
var timer = global.r_timers[argument3];
var pressed = false;

if(schema < 0){ // read once if held down
    pressed = gamepad_button_check_pressed(device, button);
} else if(schema >= 0){ // continous or repeat delay 
    if(gamepad_button_check(device, button)){
        // register press when reached timout
        pressed = timer == 0;
        if(pressed){
            // set new timeout  
            timer = schema;
        } else {
            // not reached timeout - decrease timeout
            timer--;
        }
    } else {
        // reset timeout
        timer = 0;
    }
}

// store the timer back to global
global.r_timers[argument3] = timer;

return pressed;