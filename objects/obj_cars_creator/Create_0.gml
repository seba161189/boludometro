/// @description Insert description here
// You can write your code in this editor

start_creation_speed = 2;
max_creation_speed = 5;
current_creation_speed = start_creation_speed;
alarm[0]=room_speed; //crear primer auto

//iniciar escenario
columnas_width = room_width / 3;
spot_x1 = 0;
spot_x2 = columnas_width;
spot_x3 = room_width-sprite_get_width(spr_car) //columnas_width*2;