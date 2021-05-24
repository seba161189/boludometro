/// @description Zoom window
if(keyboard_check_pressed(ord("Z")))
{
	//cambiar a displayes diferentes comparar con anterior branch q andaba bien los graficos
  zoom++;
  
  if(zoom>max_zoom)
    zoom=1;
  
 window_set_size(IDEAL_WIDTH*zoom,IDEAL_HEIGHT*zoom);
  surface_resize(application_surface,VIEW_WIDTH*zoom,VIEW_HEIGHT*zoom);
  alarm[0]=1;
  
  /*switch(zoom){
	case 1:
	DISPLAY_WIDTH = 2304;
	DISPLAY_HEIGHT = 1080;

  
 window_set_size(IDEAL_WIDTH*zoom,IDEAL_HEIGHT*zoom);
  surface_resize(application_surface,VIEW_WIDTH*zoom,VIEW_HEIGHT*zoom);
  alarm[0]=1;
  break;
}*/
}


