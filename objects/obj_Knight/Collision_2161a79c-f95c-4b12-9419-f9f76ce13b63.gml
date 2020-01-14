/// @description Insert description here
// You can write your code in this editor
player_stun = 1;
end_stun = get_timer() + 10000;

var _d = angle_difference(other.image_angle, image_angle);
image_angle += median(-3, _d, 3);

x += lengthdir_x(3,other.image_angle)
y += lengthdir_x(3,other.image_angle)

move_speed += 5 * abs(_d/180)

instance_destroy(other);