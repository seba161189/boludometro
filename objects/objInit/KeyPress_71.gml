/// @description google play games login
show_debug_message("Logros clickeado")
if achievement_available()
    {
    achievement_show_achievements()
    }
else
    {
    if !achievement_login_status()
        {
        achievement_login();
        }
    }
	/* en caso de que no logueado
// Try to connect once...
if (GooglePlayServices_Status() != GooglePlayServices_SUCCESS) { GooglePlayServices_Init(); }

// ...And then confirm all is okay or handle a fail
if (GooglePlayServices_Status() == GooglePlayServices_SUCCESS) { achievement_login(); }
else { show_message("Error initialising Google Play Services, status code = " + string(GooglePlayServices_Status())); }
