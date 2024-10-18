/// @description Core Player Logic

// Get player inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check(vk_space);

// Calculate movement
var _move = key_right - key_left;

hsp = _move * walkspeed;

vsp = vsp + grv;

if (place_meeting(x,y+1,object_block_wall)) and (key_jump) 
{
	vsp = -jumpspeed
}

// Horizontal collision
if (place_meeting(x + hsp, y ,object_block_wall)) 
{
	while (!place_meeting(x + sign(hsp), y, object_block_wall)) 
	{
		x = x + sign(hsp);	
	}
	hsp = 0	
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



