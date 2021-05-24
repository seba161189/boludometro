// dialogue
if(instance_exists(following) and !freeze){
if(following.phy_speed_y == 0)  y_offset = 0; else y_offset = -110

	cam_x = camera_get_view_x(view_camera[0])
	cam_y = camera_get_view_y(view_camera[0]);
	cam_w = camera_get_view_width(view_camera[0]);
	cam_h = camera_get_view_height(view_camera[0])
	fol_x = following.x - cam_w/2;
	fol_y = following.y - cam_h/2
	//-y_offset;

	//new_x = lerp(cam_x, fol_x, 0.05)+following.phy_speed_x*2;
	//new_y = lerp(cam_y, fol_y, 0.05)+following.phy_speed_y*1.6;
	new_x = lerp(cam_x, fol_x, speed_movement_x * global.delta_multiplier)+gamepad_stick_value_x*2.5  * global.delta_multiplier;
//	show_debug_message(speed_movement_x)
	//+following.phy_speed_x
	new_y = lerp(cam_y, fol_y, speed_movement_y * global.delta_multiplier)+gamepad_stick_value_y*2.5* global.delta_multiplier;// +following.phy_speed_y/2;
	//Check for Room Edge
	new_x = clamp(new_x, 0, room_width-cam_w);
	new_y = clamp(new_y, 0, room_height-cam_h);

	camera_set_view_pos(view_camera[0], new_x, new_y);
}
if(keyboard_check_pressed(ord("F"))){ freeze = !freeze;	}

if(shake){
    shakeDur --;
    view_xview = choose(-shakeForce,shakeForce);
    view_yview = choose(-shakeForce,shakeForce);
	camera_set_view_pos(view_camera[0],new_x+view_xview,new_y+view_yview)
    if(shakeDur <= 0){
        shake = false;
    }
}