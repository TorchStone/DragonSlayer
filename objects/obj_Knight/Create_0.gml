/// @description Insert description here
// You can write your code in this editor
invTime = 0;
flash = 0;
KnightHealth = 3;
move_speed = 0;
player_stun = 0;
stun_set = 1;
image_speed = 0;
collision_map = layer_tilemap_get_id("Floor")
jumping = 0;
death = "none"
end_jump = 0;
instance_create_layer(x,y,"Air", obj_Bow);