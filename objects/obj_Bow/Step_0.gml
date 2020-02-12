/// @description Insert description here
// You can write your code in this editor
time = get_timer();
x = obj_Knight.x + lengthdir_x(15, image_angle-55) * obj_Knight.image_xscale;
y = obj_Knight.y + lengthdir_y(15, image_angle-55) * obj_Knight.image_yscale;
image_xscale = obj_Knight.image_xscale
image_yscale = obj_Knight.image_yscale
move_towards_point(mouse_x, mouse_y, 0);
image_angle = direction
image_index = BowPower/25
//if BowPower >= 100{
//	image_index = 5;
//}
if BowPower > 0 {
	BowPower -= 1;
}