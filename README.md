Starter Project for GMS Android/Windows compatible games

Started as an OUYA project - hence the global controller buttons having OUYA specific names

Takes care of the following:

Gamepad registration
Keyboard gamepads
Window resizing
Fullscreen switching

Everything kicks off with obj_main - this makes an instance of obj_applcation_surface which looks after the screen resizing.

Global scripts handle global variables and are arranged as follows:
globals_init_game - game wide variables
globals_init_controllers - controller wide variables eg schema for button presses, default buttons for game actions and other gamepad stuff
globals_init_controller - variables for each controller - read here to see what globals to read when testing input 

Input scripts handle all the input functionality and can be seen in use in the step event in obj_main looking for input.

Remember - once your game begins - turn off seeking

global.seeking_gamepads = false

It's expensive processor wise as we are polling all connected devices for input on all buttons!

----

Note the following about screen sizing:

The OVERSCANXY variable defines a dead zone around the screen where visibility is not essential to your game.
 
If the game is run fullscreen on a device with a display aspect that would clip the overscan for a larger screen *but not anything else*, then this clipping is allowed. This provides a better experience for those users as they get bigger graphics.

Otherwise - you get the next scale down that fits on screen.
 
There is the odd occasion (Some Nexus pads I believe) where this comes in handy as it gives a bigger display. Just ensure that your OVERSCANXY area really never contains anything you *must* be able to see. If you dont want this feature - just set it's value to 0.

----

Note about control schemas:

The file globals_init_controllers contains a schema used for all control input whether it's keyboard based or gamepad.

You can define whether you want buttons to be continuous - i.e. Once pressed - the value is stored as on always, one time only - Once pressed - the value is stored as on for one frame only, or strobing with a frame delay.

Look at the comments in the script to see how to define these - it would be perfectly possible to change the schema in different rooms or for different requirements.

----

The starter project has a couple of test objects on screen one demonstrating keyboard input - the other gamepad just so you can see it in action.



Good luck with your projects

Jamie Howard
RGCD.DEV