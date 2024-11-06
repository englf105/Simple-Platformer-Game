/// @description Core Player Logic

// Get player inputs
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);

// Calculate movement
var _move = key_right - key_left;

hsp = _move * walkspeed;

vsp = vsp + grv;

if (place_meeting(x,y+1,object_block_wall)) and (key_jump) 
{
	vsp = -jumpspeed;
}

// Horizontal collision
if (place_meeting(x + hsp, y ,object_block_wall)) 
{
	while (!place_meeting(x + sign(hsp), y, object_block_wall)) 
	{
		x = x + sign(hsp);	
	}
	hsp = 0;
}
x = x + hsp;

// Vertical collision
if (place_meeting(x, y+vsp, object_block_wall))
{
	while (!place_meeting(x, y + sign(vsp), object_block_wall)) 
	{
		y = y + sign(vsp);	
	}
	vsp = 0;
}
y = y + vsp;

// Animation
if (!place_meeting(x, y+1, object_block_wall)) 
{
	if (image_index < 4) 
	{
		sprite_index = sprite_player_jumping;
		image_speed = 0;
		if (vsp > 0) image_index = 1; else image_index = 0; {}
	}
	if (image_index >= 4) 
	{
		sprite_index = sprite_player_jumpingBack;
		image_speed = 0;
		if (vsp > 0) image_index = 1; else image_index = 0; {}
	}

}
else
{	
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = sprite_player_idle;
	}
	else
	{
		sprite_index = sprite_player_running;
	}
}

if (hsp != 0) image_xscale = sign(hsp);