/// @description Insert description here
// You can write your code in this editor
var time = get_timer();

if (time >= invTime){
	KnightHealth -= 1;
	image_index = 2;
	invTime = time + 1000000;
	flash = time + 500000;
	if KnightHealth <=0 {death = "fire"}
}
