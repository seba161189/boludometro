/// @description Insert description here
// You can write your code in this editor

//sin fisicas
/*if(x>0 and keyboard_check_pressed(vk_left)){
	x-=sprite_width;
}

if(x<room_width-sprite_width and keyboard_check_pressed(vk_right)){
	x+=sprite_width;
}

if(instance_place(x,y,obj_car))
show_debug_message("YOU loose")*/

var bordeDerecho = room_width-sprite_xoffset;
//CON fisicas
if(phy_position_x-sprite_xoffset>0 and keyboard_check(vk_left)){
//doblar izquierda
	phy_speed_x-=1;
	//phy_rotation-=1;
	phy_rotation = lerp(phy_rotation, -10 ,0.2)
}
else
if(phy_position_x<bordeDerecho and keyboard_check(vk_right)){
//doblar derecha
	phy_speed_x+=1;
//	phy_rotation+=1;
	phy_rotation = lerp(phy_rotation, 10 ,0.2)
}
else
{
//si no hay nada apretado
phy_rotation = lerp(phy_rotation, 0 ,0.05)
phy_speed_x = lerp(phy_speed_x, 0 ,0.05)
}



if(phy_position_x-sprite_xoffset < 0){
	//frenar con borde izquierdo
phy_speed_x = 0;
phy_position_x = sprite_xoffset
	phy_rotation=lerp(phy_rotation, 0 ,1)
}


if( phy_position_x > bordeDerecho){
		//frenar con borde derecho
	phy_speed_x = 0;
	phy_position_x = room_width-sprite_xoffset
	phy_rotation=lerp(phy_rotation, 0 ,1)
}





//al chocar
if(instance_place(x,y,obj_car))
show_debug_message("YOU loose")

