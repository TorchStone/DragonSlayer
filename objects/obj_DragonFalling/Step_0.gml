/// @description Insert description here
// You can write your code in this editor
var time = get_timer();
if (time >= create_time + fall_time) {
	if (image_index < 5) {
		image_index += 1;
		spd_traj /= 2;
	}else{
		spd_traj = 0;
		instance_create_layer(x,y,"ground",obj_DragonWinged)
	}
	
}else{
	
	image_angle += angle_traj;
	
}
	var move_speed_this_frame = scr_frame_speed(spd_traj, delta_time);
	motion_set(image_angle, move_speed_this_frame);
	
if (time >= create_time + fall_time - .5 * 1000000){
	repeat(count)
		{
		instance_create_layer(x, y,"ground",obj_AirProj);
		}
	count += 1;

}