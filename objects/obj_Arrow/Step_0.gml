/// @description Insert description here
// You can write your code in this editor

var move_speed_this_frame = scr_frame_speed(arrow_speed, delta_time);
motion_set(image_angle, move_speed_this_frame);

arrow_speed -= 1
if (arrow_speed <= 0){instance_destroy();}