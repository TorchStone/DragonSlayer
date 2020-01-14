/// @description Insert description here
// You can write your code in this editor
var time = get_timer();
var frame = 0;

if (instance_exists(obj_Dragon)){
	if obj_Dragon.drg_health / obj_Dragon.drg_health_int >= .75 {frame = 0}
	else if obj_Dragon.drg_health / obj_Dragon.drg_health_int >= .5 {frame = 1}
	else if obj_Dragon.drg_health / obj_Dragon.drg_health_int >= .25 {frame = 2}
	else if obj_Dragon.drg_health / obj_Dragon.drg_health_int >= .05 {frame = 3}
	else if obj_Dragon.drg_health/ obj_Dragon.drg_health_int >= 0 {frame = 4}
	else {frame = 5}
}

draw_sprite(sprDrgHP,frame, 20, 20)
draw_sprite(sprKnightHP, 3 - obj_Knight.KnightHealth, 740, 20)

if win > 0 {draw_sprite(sprWinGet,0, 0, 0)}
if win < 0 {draw_sprite(sprLose,0, 0, 0)}

if (win != 0 and wait < 0) {wait = time + 3000000;}
if (win != 0 and wait > 0 and time >= wait) {room_goto(rm_menu)}