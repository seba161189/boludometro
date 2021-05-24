/// @description Load locale data

global.yd_languages		= [];
global.yd_lang_idx		= 0;
global.yd_locale_map	= ds_map_create();
global.yd_locale_words	= 0;

var default_locale_code	= "en";
var default_locale_idx	= 0;

var native_locale_code	= os_get_language();
var native_locale_idx	= 0;

// find the first file matching our naming convention
var locale_file_name = file_find_first( "locale_*.json", 0 );
if ( locale_file_name == "" )
{
	show_error( "No locale files found!", true );
	return;
}
while ( locale_file_name != "" )
{
	show_debug_message("Loading locale file: " + locale_file_name );

	// open the locale file for reading
	var locale_file	= file_text_open_read( locale_file_name );
	if ( locale_file == -1 )
	{
		show_error( "LOCALE WARNING: Error reading locale file " + locale_file_name, true);
		return;
	}

	// build the JSON text
	var json_str	= "";
	var j = 0;
	while ( !file_text_eof(locale_file) )
	{
		json_str += file_text_read_string(locale_file);
		file_text_readln(locale_file);
		j++;
	}
	file_text_close(locale_file);
	//show_debug_message( "Loaded locale_map from " + string(j) + " lines of text." );

	// convert the JSON to a usable ds_map
	var locale_map = json_decode(json_str);
	
	if ( locale_map == -1 || !ds_map_exists( locale_map, "locale_code" ) )
	{
		show_error( "LOCALE WARNING: Invalid locale data inside: " + locale_file_name, true );
		return;
	}
	
	// get the locale code from the locale data.
	var locale_code = locale_map[? "locale_code"];
	ds_map_add( global.yd_locale_map, locale_code, locale_map );

	// if this is the native locale, set the native locale index
	if ( locale_code == native_locale_code )
		native_locale_idx = global.yd_lang_idx;
	// if this is the default locale, set the default locale index
	else if ( locale_code == default_locale_code )
		default_locale_idx = global.yd_lang_idx;

	// add this locale's code to the list of available locales
	global.yd_languages[global.yd_lang_idx] = locale_code;
	global.yd_lang_idx++;	

	locale_file_name = file_find_next();	
}
file_find_close();

// set the default locale to the player's native locale if possible
if ( ds_map_exists( global.yd_locale_map, native_locale_code ) )
{
	show_debug_message("Setting locale to native language.");
	global.yd_locale_words = global.yd_locale_map[? native_locale_code];
	global.yd_lang_idx = native_locale_idx;

// otherwise set it to English
} else if ( ds_map_exists( global.yd_locale_map, default_locale_code ) ) {
	show_debug_message("Setting locale to default language.");
	global.yd_locale_words = global.yd_locale_map[? default_locale_code];
	global.yd_lang_idx = default_locale_idx;

// if all else failes, use the first language on the stack
} else {
	show_debug_message("Setting locale to fallback language.");
	global.yd_lang_idx = 0;
	global.yd_locale_words = global.yd_locale_map[? global.yd_languages[0]];
}

show_debug_message("Locale set to " + global.yd_languages[global.yd_lang_idx] );
