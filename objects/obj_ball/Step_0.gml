
physics_apply_force(phy_position_x,phy_position_y,0,phy_mass*100*-1)

if(phy_speed_y != 0) //quieta
if(phy_speed_y < 0) {
phy_speed_y = -max_speed_y; //subiendo
if(instance_exists(obj_car))
with(obj_car){
phy_position_y-=other.phy_speed_y*2; //mover autos el doble inverso
}

}
else
phy_speed_y = max_speed_y; // bajando

if(phy_speed_x > 10)
phy_speed_x = max_speed_x;

if(phy_speed_x < -10)
phy_speed_x = -max_speed_x;
