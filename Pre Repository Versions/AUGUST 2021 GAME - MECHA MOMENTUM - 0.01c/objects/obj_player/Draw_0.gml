/// @description Insert description here
// You can write your code in this editor
draw_self();
//draw_text(10, 10, "Velocity_X " + string(vel_[@ X]));
//draw_text(10, 25, "Velocity_Y " + string(vel_[@ Y]));
//draw_text(10, 45, "Acceleration_X " + string(acc_[@ X]));
//draw_text(10, 60, "Acceleration_Y " + string(acc_[@ Y]));
draw_text(10, 10, string(state_));

if(state_ == player_state_.swing)
{
	draw_line_width(grapple_x, grapple_y, rope_x, rope_y, 2);

}