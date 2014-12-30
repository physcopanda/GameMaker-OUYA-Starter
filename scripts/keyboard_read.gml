// keyboard_read(key, schema, timer)
// key is the key code we are checking for
// store_var is the global variable we are storing true on read
// schema is < 0 for read once on button hold
// schema is = 0 for continous read on button hold
// schema is > 0 for key repeat read (frame delay)

var key = argument0;
var schema = argument1;
var timer = global.r_timers[argument2];
var pressed = false;

if(schema < 0){ // read once if held down
    pressed = keyboard_check_pressed(key);
} else if(schema >= 0){ // continous or repeat delay 
    if(keyboard_check(key)){
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
global.r_timers[argument2] = timer;

return pressed;