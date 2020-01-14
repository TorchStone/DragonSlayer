/// @description Insert description here
// You can write your code in this editor
image_angle = obj_Dragon.image_angle;
create_time = get_timer();
fall_time = 2 * 1000000;
angle_traj = obj_Dragon.last_angle;
spd_traj = obj_Dragon.drg_speed;
count = 1;
image_speed = 0;
instance_destroy(obj_Dragon);
collision_map = layer_tilemap_get_id("Floor")