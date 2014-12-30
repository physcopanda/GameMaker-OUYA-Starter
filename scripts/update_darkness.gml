if(!surface_exists(surf)){
    surf = surface_create(global.ww, global.hh);
}
surface_set_target(surf);
draw_clear_alpha(c_black, 0.75);
surface_reset_target();