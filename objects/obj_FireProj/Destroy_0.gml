/// @description Insert description here
// You can write your code in this editorif (tilemap_get_at_pixel(collision_map,x,y) == 20){
if (tilemap_get_at_pixel(collision_map,x,y) != 20){
	instance_create_layer(x,y,"ground",obj_FireObs);
}