/// @description score y aumento velocidad

//score
score+=1;



//premios
if(price1Enabled and score>1000){
price1Enabled=false;
show_debug_message("pasaste los 1000")
}

if(price2Enabled and score>2000){
price2Enabled=false;
show_debug_message("pasaste los 2000")
}

if(keyboard_check_pressed(ord("R"))){
room_restart();
}

if(keyboard_check_pressed(vk_space)){
obj_ball.phy_speed_y = -10;
obj_ball.phy_speed_x = irandom_range(-10,10)
}