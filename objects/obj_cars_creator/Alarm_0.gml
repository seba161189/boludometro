/// @description Insert description here
// You can write your code in this editor
/// @description crear auto
var xOffsetCar = sprite_get_xoffset(spr_car)

instance_create_depth(choose(spot_x1+xOffsetCar,spot_x2+xOffsetCar+random_range(-xOffsetCar,xOffsetCar),spot_x3+xOffsetCar),-sprite_get_height(spr_car)
,0,obj_car)
alarm[0]= (room_speed*2)/current_creation_speed;
