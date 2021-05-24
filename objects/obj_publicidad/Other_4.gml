

switch(room){
	case Doors:
	case Intro:
	case Avion:
	case Guiza:
	case Egipto:
	case Egipto2:
	case Pozo:
	case rm_splash_screen:
	break;
	case Start:
		show_banner_publicity();
		break;
	default:
		show_interstitial_publicity();
		break;

}