/// @description Insert description here
// You can write your code in this editor
var time = get_timer();

if instance_exists(obj_Dragon){
	if (time >= 1000000 * .1 + last_fire){
		instance_create_layer(obj_Knight.x, obj_Knight.y, "air", obj_Arrow);
		last_fire = time;
	}
}