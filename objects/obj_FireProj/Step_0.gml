/// @description Insert description here
// You can write your code in this editor

if (get_timer() >= destroy_time){
	instance_destroy();
}
var move_speed_this_frame = scr_frame_speed(fire_speed, delta_time);
motion_set(image_angle, move_speed_this_frame);
