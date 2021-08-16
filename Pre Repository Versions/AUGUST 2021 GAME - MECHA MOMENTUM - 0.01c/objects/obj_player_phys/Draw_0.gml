/// @description Insert description here
// You can write your code in this editor
draw_self();
var _i = 1;
var _pad = 15;
draw_text(10, _pad * _i, "Input: \t" + string(input_dir_._x) + " \t" + string(input_dir_._y)); _i++;
draw_text(10, _pad * _i, "Acceleration: \t" + string(acc_._x) + " \t" + string(acc_._y)); _i++;
_i++;
draw_text(10, _pad * _i, "Velocity: \t" + string(vel_._x) + " \t" + string(vel_._y)); _i++;
draw_text(10, _pad * _i, "Vel Scaled: \t" + string(vel_scaled_._x) + " \t" + string(vel_scaled_._y)); _i++;
_i++;
draw_text(10, _pad * _i, "Position: \t" + string(pos_._x) + " \t" + string(pos_._y)); _i++;
draw_text(10, _pad * _i, "Pos Int: \t" + string(pos_int_._x) + " \t" + string(pos_int_._y)); _i++;
draw_text(10, _pad * _i, "Pos Frac: \t" + string(pos_frac_._x) + " \t" + string(pos_frac_._y)); _i++;
draw_text(10, _pad * _i, "Pos Delt: \t" + string(pos_delta_._x) + " \t" + string(pos_delta_._y)); _i++;
_i++;
draw_text(10, _pad * _i, "Wall Distance: \t" + string(wall_dist_)); _i++;
draw_text(10, _pad * _i, "Bbox Left: \t" + string(bbox_left)); _i++;
draw_text(10, _pad * _i, "Bbox Right: \t" + string(bbox_right)); _i++;