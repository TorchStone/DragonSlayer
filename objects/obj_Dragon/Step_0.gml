var time = get_timer();

// Default Speed and Target
if (drg_attack_step == 0){
	var Targ_X = obj_Knight.x;
	var Targ_Y = obj_Knight.y;
}

if drg_health <= 0 {instance_create_layer(x,y,"air",obj_DragonFalling)}

// Attack iniciate
if (distance_to_object(obj_Knight) <= (1.5 * drg_range)) && (drg_attack_step == 0) {
	drg_attack_step = 1;
	mirrored = choose(1,-1);
	attack_start = time;
		
	if (obj_Knight.move_speed > 130){
		drg_attack_type = "fast"
		relative_dist = 300;
		relative_angl = 20 * mirrored;
		image_index = 1; //remove after test
		drg_attackboost = 150;
		drg_speed = drg_speed_int + drg_attackboost;
	} else if (obj_Knight.move_speed >= 70){
		drg_attack_type = "slow"
		relative_dist = 200;
		relative_angl = 30 * mirrored;
		image_index = 2; //remove after test
		drg_attackboost = 0;
		drg_speed = drg_speed_int + drg_attackboost;
	} else {
		drg_attack_type = "direct"
		relative_dist = 200;
		relative_angl = angle_difference(image_angle, obj_Knight.image_angle) - 180;
		image_index = 3; //remove after test
		drg_attackboost = 0;
		drg_speed = drg_speed_int + drg_attackboost
	}
}

// Attack controller
if (drg_attack_step >= 1) {
	
	//Releative Targeting
	Targ_X = obj_Knight.x + lengthdir_x(relative_dist, obj_Knight.image_angle + relative_angl);
	Targ_Y = obj_Knight.y + lengthdir_y(relative_dist, obj_Knight.image_angle + relative_angl);
	
	//Switch Attack Steps
	if (time >= attack_start + 5 * 1000000){drg_attack_step = 3;}
	if (distance_to_point(Targ_X, Targ_Y) < 1){
		drg_attack_step += 1;
		switch (drg_attack_type) 
			{			
			case "fast":
				relative_dist = 600;
				relative_angl = 10 * mirrored;
				break;
			case "slow":
				relative_dist = 400;
				relative_angl = 15 * mirrored;
				break;
			case "direct":
				relative_dist = 0;
				relative_angl = angle_difference(image_angle, obj_Knight.image_angle);
				break;
		
			}
		}
	
	// Fire Control
	if (drg_attack_step == 2){
		if (time >= last_time + .05 * 1000000) {
			instance_create_layer(x + lengthdir_x(55,image_angle), y + lengthdir_y(55,image_angle),"air",obj_FireProj);
			last_time = time;
			}
		}
	
	//Reset
	if (drg_attack_step >= 3){
		if (end_cool == 0) {
			drg_speed = drg_speed_int;
			end_cool = time + 3 * 1000000;
			relative_dist = 5000;
			relative_angl = irandom_range(0,360);
			image_index = 4; //remove after test
				
		}else if (time >= end_cool){ 
			drg_attack_step = 0;
			end_cool = 0;
			image_index = 0; //remove after test
		}
			
	}
}


move_towards_point(Targ_X, Targ_Y, 0)

// Turn Control
var _d = angle_difference(direction, image_angle);
image_angle += median(-3, _d, 3);

// Trajectory saveing
last_angle = median(-3, _d, 3);

// Speed Control
var move_speed_this_frame = scr_frame_speed(drg_speed, delta_time);
motion_set(image_angle, move_speed_this_frame);

if image_index = 5 {
	if flash_count >= 3 {image_index = last_frame;}
	else {flash_count += 1;}
}