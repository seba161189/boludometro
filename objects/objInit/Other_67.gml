var ident = string(async_load[? "id"]);
var status = string(async_load[? "status"]);
var desc =  string(async_load[? "description"]);
var resstring = string(async_load[? "resultString"]);
var errorstring = string(async_load[? "errorString"]);

if (ident == global.cloudSaveID)
{
	show_debug_message("Async cloud SAVE event occurred with ident = " + ident
	+ " status = " + status
	+ " desc = " + desc 
	+ " resstring = " + resstring
	+ " error = " + errorstring);
	
}
else if (ident == global.cloudLoadID)
{
	show_debug_message("Async cloud LOAD event occurred with ident = " + ident
	+ " status = " + status
	+ " desc = " + desc 
	+ " resstring = " + resstring
	+ " error = " + errorstring);
	
	// If we downloaded our data okay, then apply it
	if (status == 0 && desc == "GoogPS Demo HighScore String") { global.savedScore = resstring; }
}
else { show_debug_message("!! Unknown Cloud event recieved !!"); }