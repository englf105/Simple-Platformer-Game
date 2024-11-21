/// @description Running

if (stamina > 0)
{
	image_speed = 2;
	walkspeed = 8;
	stamina = stamina - 0.1;
	
	if (stamina = 0)
	{
		image_speed = 1.5;
		walkspeed = 5;
	}
}