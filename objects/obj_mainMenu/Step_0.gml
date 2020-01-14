/// @description Insert description here
// You can write your code in this editor
left = keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left);
right = keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right);
select = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

var move = 0;

if (left){move -= 1;}
if (right){move += 1;}

if (move != 0) {
	opt += move;
	if (opt < 0) {opt = array_length_1d(menu) - 1;}
	if (opt > (array_length_1d(menu) - 1)) {opt = 0;}
	
	menu[0].image_index = 0;
	menu[1].image_index = 0;
	
	menu[opt].image_index = 1;
	
	}

if (select) {scr_mainMenu();} 