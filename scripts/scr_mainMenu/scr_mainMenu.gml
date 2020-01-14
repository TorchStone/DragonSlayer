switch (obj_mainMenu.opt){
	//play
	case 0:{
		room_goto(rm_Level)
		break;
		}
	//quit
	case 1:{
		game_end();
		break;
		}

	default:{break;}
}