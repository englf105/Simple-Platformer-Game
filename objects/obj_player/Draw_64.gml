/// @description ??
draw_text(10, 1010, "Move = W and A")
draw_text(10, 1030, "Jump = Space")
draw_text(10, 1050, "Run = Shift")


draw_sprite_ext( spr_background_hud, lives_counter, healthbar_x, healthbar_y, 2, 2, 0, c_white, 1);


draw_sprite_ext( spr_background_staminabar, 0, 880, 900, stamina, 1, 0, c_white, staminabar_opacity);

if (stamina < 20)
{
	staminabar_opacity = 1;
}
else 
{
	staminabar_opacity -= 0.1;
	
	if (staminabar_opacity = 0)
	{
		staminabar_opacity += 0.1;
	}
}
