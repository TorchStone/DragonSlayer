/// @description Insert description here
// You can write your code in this editor
var time = get_timer();

if (time >= wait && attack < 0) {
	attack = irandom(1)
	start = time;
	}

switch (attack) {
	case 0:{
		move_towards_point(obj_Knight.x,obj_Knight.y,0);
		direction += 20 * (angle_difference(direction, image_angle)/abs(angle_difference(direction, image_angle)))
		if (time >= last_time + .05 * 1000000) {
			instance_create_layer(x + lengthdir_x(55,image_angle), y + lengthdir_y(55,image_angle),"ground",obj_FireProj);
			last_time = time;
		}
		var _d = angle_difference(direction, image_angle);
		image_angle += median(-3, _d, 3);
		if (time >= start + (2 * 1000000)){attack = -1;}
		wait = time + (2 * 1000000);
		break;
	}
	case 1:{
		if (time >= last_time + .05 * 1000000) {
			instance_create_layer(x + lengthdir_x(55,image_angle), y + lengthdir_y(55,image_angle),"ground",obj_FireProj);
			last_time = time;
		}
		image_angle += 2;
		if (time >= start + (4 * 1000000)){attack = -1;}
		wait = time + (2 * 1000000);
		break;
	}
}

if (time >= wait1 && distance_to_object(obj_Knight) < 70) {
	if (count < 20){
		repeat(20)
			{
			instance_create_layer(x, y,"ground",obj_AirProj);
			}
		count += 1;
	}else{
	wait1 = time + (4 * 1000000)
	}
}