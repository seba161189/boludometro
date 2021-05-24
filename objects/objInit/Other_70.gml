var name;
var ident = async_load[? "id"];


if (ident == achievement_our_info)
{
	show_debug_message("Social async event achievement_our_info received");
	
    var name = ds_map_find_value(async_load, "name" );
    var playerid = ds_map_find_value(async_load, "playerid" );
    show_debug_message("Found name " + string(name) + " playerid " + string(playerid));
  
    global.OurName = name;
    global.OurId = playerid;
	
    // If we are now logged-in, let's look for any cloud saves
	if (playerid != -1) { global.cloudLoadID = cloud_synchronise(); }
}
else { show_debug_message("!! Unhandled social event received !! ID = " + string(ident)); }


/*
/// @description Insert description here
// You can write your code in this editor
if ds_map_exists(async_load, "id")
{
    switch(async_load[? "id"])
    {
        case achievement_our_info:
        global.PlayerName = async_load[? "name"];
        global.PlayerID = async_load[? "playerid"];
        show_debug_message("GOOGLE SERVICES: User " + global.PlayerName + " with ID " + string(global.PlayerID) + " has logged in");
        break;
    }
}*/