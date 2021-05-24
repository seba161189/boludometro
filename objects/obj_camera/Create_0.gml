following = obj_player;
freeze = false;
debug = false;
y_offset = 110;
speed_movement_x = 0.03;
speed_movement_y = 0.03;
if(instance_exists(following)){
	var cam_w = VIEW_WIDTH;
	var new_x = following.x - cam_w/2;
	var new_y = following.y - cam_w/2;
	camera_set_view_pos(view_camera[0], new_x, new_y);
}
scr_create_stick_if_not_exist()
alarm[0]=1; //activate area

shake = false;
shakeDur = 60;
shakeForce = 1;