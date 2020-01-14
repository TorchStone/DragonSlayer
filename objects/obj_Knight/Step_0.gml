// Tweak Factors
var max_speed_fac = 1.2;
var accel_fac = 1.2;
var turn_factor = 1;
var stun_factor = .7;
var stun_boost_factor = 1.5;
var time = get_timer();
var	jump_time = 1000000;
//Jumping
if(keyboard_check(vk_space) && jumping == 0){
	jumping = 1;
	player_stun = 1;
	end_jump = time + jump_time;
	end_stun = time + jump_time;
}
if (jumping == 1){
	if (time <= end_jump - jump_time / 2){
		image_xscale += .005;
		image_yscale += .005;
	}else{
		image_xscale -= .005;
		image_yscale -= .005;
	}
	if (time >= end_jump){
		image_xscale = 1;
		image_yscale = 1;
		jumping = 0;
	}
}


//Falling
if (jumping == 0 && death == "none"){
	if (tilemap_get_at_pixel(collision_map,x,y) == 20){
			KnightHealth = 0;
			death = "fall";
	}
}

//Stuned
if ((player_stun == 1) && (time >= end_stun)){
	player_stun = 0;
	stun_set = 1;
	}

//Movement
if (player_stun == 0){
	
	// Left-Right
	if(keyboard_check(vk_left) || keyboard_check(ord("A"))){
		image_angle += 1.5 * turn_factor;
		if (move_speed > 0){move_speed -= .2 * accel_fac}
		if (move_speed < 0){move_speed += .5 * accel_fac}
	}

	if(keyboard_check(vk_right) || keyboard_check(ord("D"))){
		image_angle -= 1.5 * turn_factor;
		if (move_speed > 0){move_speed -= .2 * accel_fac}
		if (move_speed < 0){move_speed += .5 * accel_fac}
	}

	// Accel
	if((keyboard_check(vk_up) || keyboard_check(ord("W"))) && !(keyboard_check(vk_left) ||
		keyboard_check(ord("A")) || keyboard_check(vk_right) || keyboard_check(ord("D"))))
	{
		if (stun_set = 1){
			move_speed = 50 * stun_boost_factor;
			stun_set = 0;
			}
		if (move_speed >= 0 && move_speed < 5){
			if (player_stun == 0 && stun_set == 0){
				player_stun = 1;
				end_stun = time + (700 * stun_factor);
			}
		}
		if (move_speed <= 200 * max_speed_fac){move_speed += 5 * accel_fac}
	}
	
		// Deccel or Backwards
	if((keyboard_check(vk_down) || keyboard_check(ord("S"))) && !(keyboard_check(vk_left) ||
		keyboard_check(ord("A")) || keyboard_check(vk_right) || keyboard_check(ord("D"))))
	{
		if (stun_set = 1){
			move_speed = -40 * stun_boost_factor;
			stun_set = 0;
			}
		if (move_speed > 0){move_speed -= 2 * accel_fac;}
		if (move_speed <= 0 && move_speed > -5){
			if (player_stun == 0 && stun_set == 0){
				player_stun = 1;
				end_stun = time + (1000 * stun_factor);
			}
		}
		if (move_speed <= -5 && move_speed >= -100 * max_speed_fac){move_speed -= 2 * accel_fac}
	}
}

if (time >= flash and time < invTime) {
	image_speed = .5;
	if (image_index > 1) {image_index = 0}
}else if (time >= invTime){
	image_speed = 0;
	image_index = 0;
}

//death
if KnightHealth <=0 {obj_GuiControl.win = -1;}
if (death = "fall"){
	player_stun = 1;
	move_speed -= 1;
	end_stun = time + 100000000
	if (image_xscale >= 0){
	image_xscale -= .01;
	image_yscale -= .01;
	}
	if (tilemap_get_at_pixel(collision_map,x,y) != 20){move_speed = 0;}
}

var move_speed_this_frame = scr_frame_speed(move_speed, delta_time);
motion_set(image_angle, move_speed_this_frame);