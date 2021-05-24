/// @desc caga asincronica de Publicidad
// Esto es el evento asincrono que recibe la publicidad de Admob, no es necesario modificarlo,
// las variables que conectan este evento y la publicidad se encuentrar en el Game Start.
var _id = async_load[? "id"];

if(_id == GoogleMobileAds_ASyncEvent) {
	var ident = async_load[? "type"];
	switch(ident) {
		case "banner_load":
			if(async_load[? "loaded"] == 1) {
				var _bw = GoogleMobileAds_BannerGetWidth();
				var _bh = GoogleMobileAds_BannerGetHeight();
				var _hh = display_get_height();
				var _ww = display_get_width();
				GoogleMobileAds_MoveBanner((_ww / 2) - (_bw / 2), _hh - _bh);
			}
			break;
		case "interstitial_load":
			if(async_load[? "loaded"] == 1) {
				interstitial_loaded = true;
			}else{
			GoogleMobileAds_LoadInterstitial();
			}
			break;
		case "interstitial_closed":
			GoogleMobileAds_LoadInterstitial();
			break;
			
		case "rewardedvideo_adloaded":
            rewarded_loaded = true;
            break;
		case "rewardedvideo_loadfailed":
			show_debug_message("Error Code: " + string(async_load[? "errorcode"]));
			rewarded_loaded = false;
			GoogleMobileAds_LoadRewardedVideo(rewarded_id);
			break;
			
			case "rewardedvideo_adopened":
            show_debug_message("Rewards Video Opened");
            break;
        case "rewardedvideo_videostarted":

            show_debug_message("Rewards Video Started");
            break;
        case "rewardedvideo_watched":
            show_debug_message("Rewards Video Watched");
            rewarded_viewed = true;
			//tipoRecompensa = async_load[? "currency"];
			if(tipoRecompensa == "Pista"){
				instance_create_depth(x,y,-200,obj_objetivoactual_menu);
			}else if(tipoRecompensa == "Vidas"){
				total_lives = 4;
				show_message_in_center_screen(yd_lang("lives_recovered_message"))
				save_game();
			}
			GoogleMobileAds_LoadRewardedVideo(rewarded_id);

			rewarded_loaded = false;

            break;
        case "rewardedvideo_adclosed":
            show_debug_message("Rewards Video Closed");
            if rewarded_viewed == false
                {
					// Reward video was closed before the end
					show_message_async(yd_lang("noreward"));
	        }   else {
				rewarded_viewed = false;
				GoogleMobileAds_LoadRewardedVideo(rewarded_id);
			}
			
			
			
			break;
	}
}