/// @description ??

draw_sprite_ext( spr_background_hud, lives_counter, healthbar_x, healthbar_y, 2, 2, 0, c_white, 1);

if (stamina < 20)
{
	draw_sprite_ext( spr_background_staminabar, 0, 880, 900, stamina, 1, 0, c_white, 1);
}
