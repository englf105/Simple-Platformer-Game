/// @description Core Player Logic

// Get player inputs
var _key_left = keyboard_check(ord("A"));
var _key_right = keyboard_check(ord("D"));
var _key_jump = keyboard_check_pressed(vk_space);

// Calculate movement
var _move = _key_right - _key_left;

hsp = _move * walkspeed;

vsp = vsp + grv;

if (place_meeting(x,y+1,obj_block_wall)) and (_key_jump) 
{
	vsp = -jumpspeed;
}

// Horizontal collision
if (place_meeting(x + hsp, y ,obj_block_wall)) 
{
	while (!place_meeting(x + sign(hsp), y, obj_block_wall)) 
	{
		x = x + sign(hsp);	
	}
	hsp = 0;
}
x = x + hsp;

// Vertical collision
if (place_meeting(x, y+vsp, obj_block_wall))
{
	while (!place_meeting(x, y + sign(vsp), obj_block_wall)) 
	{
		y = y + sign(vsp);	
	}
	vsp = 0;
}
y = y + vsp;

// Animation
if (!place_meeting(x, y+1, obj_block_wall)) 
{
	if (image_index < 4) 
	{
		sprite_index = spr_player_jumping;
		image_speed = 0;
		if (vsp > 0) image_index = 1; else image_index = 0; {}
	}
	if (image_index >= 4) 
	{
		sprite_index = spr_player_jumping_back;
		image_speed = 0;
		if (vsp > 0) image_index = 1; else image_index = 0; {}
	}

}
else
{	
	image_speed = 1.5;
	if (hsp == 0)
	{
		sprite_index = spr_player_idle;
	}
	else
	{
		sprite_index = spr_player_running;
	}
}

if (hsp != 0) image_xscale = sign(hsp);

// Running

if (keyboard_check(vk_shift) = 1)
{
	image_speed = 2;
}
else {
	walkspeed = 5;
	image_speed = 1.5;
	
}

if (stamina < 20) and (keyboard_check(vk_shift) = 0)
{
	stamina += 0.1;
}

// lives system

if (lives <=0) {
	game_restart();

}

if (y > 1100) {
	lives -= 1;
	lives_counter += 1;
	x = xstart;
	y = ystart;

}
