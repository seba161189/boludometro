var base_w = IDEAL_WIDTH;
var base_h = IDEAL_HEIGHT;
var max_w = DISPLAY_WIDTH;
var max_h = DISPLAY_HEIGHT;
var aspect = max_w / max_h;
if (max_w < max_h)
    {
    // portait
    VIEW_WIDTH = min(base_w, max_w);
    VIEW_HEIGHT  = VIEW_WIDTH / aspect;
    }
else
    {
    // landscape
    VIEW_HEIGHT = min(base_h, max_h);
    VIEW_WIDTH = VIEW_HEIGHT * aspect;
    }
camera_set_view_size(view_camera[0], floor(VIEW_WIDTH), floor(VIEW_HEIGHT))

if view_wport[0] != surface_get_width(application_surface) || view_hport[0] != surface_get_height(application_surface)
    {
    surface_resize(application_surface, floor(VIEW_WIDTH),floor(VIEW_HEIGHT))
    }
//surface_resize(application_surface, floor(VIEW_WIDTH), floor(VIEW_HEIGHT));
//surface_resize(application_surface, view_wport[0], view_hport[0]);
//surface_resize(application_surface, IDEAL_WIDTH,IDEAL_HEIGHT);