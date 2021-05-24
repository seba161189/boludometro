/// @desc Publicidad

#region // Publicidad:
	if(os_type == os_ios) {
		app_id = "nonne";
		banner_id = "nonne"
		interstitial_id = "nonne"
	} else if(os_type == os_android) {
		
		app_id = "ca-app-pub-6971140263671255~8582485496";
		// De prueba:
/*  Carga de aplicación			ca-app-pub-3940256099942544/3419835294
	Banner						ca-app-pub-3940256099942544/6300978111
	Intersticial				ca-app-pub-3940256099942544/1033173712
	Vídeo intersticial			ca-app-pub-3940256099942544/8691691433
	Vídeo bonificado			ca-app-pub-3940256099942544/5224354917
	Nativo avanzado				ca-app-pub-3940256099942544/2247696110
	Nativo avanzado de vídeo	ca-app-pub-3940256099942544/1044960115*/
		/*banner_id = "ca-app-pub-3940256099942544/6300978111"
		interstitial_id = "ca-app-pub-3940256099942544/1033173712"
		rewarded_id ="ca-app-pub-3940256099942544/5224354917"*/
		
		// Para subir a la tienda:
		banner_id = "ca-app-pub-6971140263671255/2206688955"
		interstitial_id = "ca-app-pub-6971140263671255/4728910512"
		rewarded_id = "ca-app-pub-6971140263671255/8364331712"
		//vidas_rewarded_id = "ca-app-pub-6971140263671255/8072618830"
	}

	if(os_type == os_ios or os_type == os_android) {
		
		// Cargar intersticial:
		GoogleMobileAds_Init(interstitial_id, app_id);
		GoogleMobileAds_LoadInterstitial();
		interstitial_loaded = false;
		interstitial_show = false;
		
		//Cargar rewarded
		GoogleMobileAds_LoadRewardedVideo(rewarded_id);
		rewarded_loaded = false;
		rewarded_viewed = false;
		
		/*GoogleMobileAds_LoadRewardedVideo(vidas_rewarded_id);
		vidas_rewarded_loaded = false;
		vidas_rewarded_viewed = false;*/
		
		// Cargar banner:
		GoogleMobileAds_AddBannerAt(banner_id, GoogleMobileAds_Banner, room_width / 2, room_height);
		GoogleMobileAds_HideBanner()
	}
#endregion