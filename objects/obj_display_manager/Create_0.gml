/// @description Display Properties
var ideal_width=0;
var ideal_height=display_get_height(); //room height
zoom=1;
max_zoom=1;
var display_width =768 //display_get_width();
//2304//
var display_height = 1366//display_get_height();
//1080//

aspect_ratio=display_width/display_height;

ideal_width=round(ideal_height*aspect_ratio);
//ideal_height=round(ideal_width / aspect_ratio);


/*
//Perfect Pixel Scaling
if(display_width mod ideal_width != 0)
{
  var d = round(display_width/ideal_width);
  ideal_width=display_width/d;
}
if(display_height mod ideal_height != 0)
{
  var d = round(display_height/ideal_height);
  ideal_height=display_height/d;
}
*/
//Check for odd numbers
if(ideal_width & 1)
  ideal_width++;
if(ideal_height & 1)
  ideal_height++;
    
//Calculate Max Zoom
max_zoom=floor(display_width/ideal_width);  
  
for(var i=1; i<=room_last; i++)
{
  if(room_exists(i))
  {
    room_set_viewport(i,0,true,0,0,ideal_width,ideal_height);
    room_set_view_enabled(i,true);
  }
}


alarm[0]=1; //Sorry.  This line got left out of the tutorial vid.  This will center the window after the initial resizing.

globalvar IDEAL_WIDTH,IDEAL_HEIGHT,GUI_WIDTH,GUI_HEIGHT,
VIEW_WIDTH, VIEW_HEIGHT,
HALF_GUI_WIDTH, HALF_GUI_HEIGHT, DISPLAY_WIDTH,DISPLAY_HEIGHT;


	IDEAL_WIDTH = ideal_width;
	IDEAL_HEIGHT = ideal_height;				// scale the height to match the aspect ratio
	DISPLAY_HEIGHT = display_height;
	DISPLAY_WIDTH = display_width;
    
	//set the size of the GUI to match the proper width and height
	GUI_WIDTH = ideal_width;
	HALF_GUI_WIDTH = GUI_WIDTH / 2;							//very useful variable to save	
	
	GUI_HEIGHT = ideal_height;
	HALF_GUI_HEIGHT = GUI_HEIGHT / 2;						//very useful variable to save
	window_set_size(ideal_width,ideal_height);
display_set_gui_size(ideal_width,ideal_height);
//surface_resize(application_surface,ideal_width*zoom,ideal_height*zoom);
  surface_resize(application_surface,DISPLAY_WIDTH,DISPLAY_HEIGHT);
display_set_gui_size(IDEAL_WIDTH,IDEAL_HEIGHT)







