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

Good luck with your projects

Jamie Howard
RGCD.DEV