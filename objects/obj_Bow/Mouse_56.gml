/// @description Insert description here
// You can write your code in this editor


if BowPower >= 50 {
	instance_create_layer(x,y,"Air",obj_Arrow);
	cooldown = time + 1000000
	BowPower = 0;
}
