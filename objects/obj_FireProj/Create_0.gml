/// @description Insert description here
// You can write your code in this editor
destroy_time = get_timer() + .3 * 1000000;
fire_speed = 600;
collision_map = layer_tilemap_get_id("Floor");
if instance_exists(obj_Dragon){image_angle = obj_Dragon.image_angle;}
if instance_exists(obj_DragonWinged){image_angle = obj_DragonWinged.image_angle;}